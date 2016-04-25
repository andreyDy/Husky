package ua.kiev.husky.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.kiev.husky.exception.NameExistsException;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.User;
import ua.kiev.husky.exception.PhotoErrorException;
import ua.kiev.husky.security.CurrentUser;
import ua.kiev.husky.security.UserInfo;
import ua.kiev.husky.service.CourseService;
import ua.kiev.husky.service.UserService;
import ua.kiev.husky.validation.CourseForm;
import ua.kiev.husky.validation.validator.CourseFormTimeValidator;

import javax.validation.Valid;
import java.io.*;
import java.util.Set;


@Controller
public class CourseController {

    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @ModelAttribute("user")
    UserInfo findUserInfo(@CurrentUser UserInfo userInfo) {
        return userInfo;
    }

    @RequestMapping("/courses")
    public String showAllCourses(Model model) {
        model.addAttribute("courses", courseService.findAll());
        return "course/courses";
    }

    @RequestMapping("/course/{id}")
    public String showCourse(@PathVariable("id") int courseId, @ModelAttribute("user") UserInfo userInfo,
                             Model model) {
        if (userService.enrollInCourse(userInfo.getId(), courseId)) {
            model.addAttribute("added", true);
        }
        model.addAttribute("course", courseService.findById(courseId));
        return "course/course";
    }

    @RequestMapping("/settings/courses")
    public String showOwnCourses(Model model, @ModelAttribute("user") UserInfo userInfo) {
        model.addAttribute("courses", userService.findById(userInfo.getId()).getOwnCourses());
        return "course/coursesTable";
    }

    @RequestMapping("/settings/course/add")
    public String provideCourseForm(Model model) {
        model.addAttribute ("courseForm", new CourseForm());
        return "course/courseAdd";
    }

    @RequestMapping(value = "/settings/course/add", method = RequestMethod.POST)
    public String processCourseForm(@Valid @ModelAttribute("courseForm") CourseForm courseForm,
                                    BindingResult result, @RequestParam("cover") MultipartFile cover,
                                    @ModelAttribute("user") UserInfo userInfo) {
        new CourseFormTimeValidator().validate(courseForm, result);
        if (result.hasErrors()) {
            return "course/courseAdd";
        }
        if (cover.isEmpty()) {
            throw new PhotoErrorException();
        }
        saveFile(cover, courseForm.getName());
        User teacher = userService.findByEmail(userInfo.getEmail());
        if (!createCourse(new Course(courseForm, teacher), result)) {
            return "course/courseAdd";
        }
        return "redirect:/settings/course/add/success";
    }

    private boolean createCourse(Course course, BindingResult result) {
        try {
            courseService.createCourse(course);
        } catch (NameExistsException e) {
            result.rejectValue("name", "valid.courseNameIsNotUnique");
            return false;
        }
        return true;
    }

    private void saveFile(MultipartFile file, String courseName) {
        String type = file.getOriginalFilename().split("\\.")[1];
        String fileName = courseName.trim() + "." + type;
        try (BufferedOutputStream out = new BufferedOutputStream(
                new FileOutputStream(
                        resourceLoader.getResource("/resources/images/user/" + fileName).getFile()))) {
            out.write(file.getBytes());
            out.flush();
        } catch (IOException e) {
            throw new PhotoErrorException();
        }
    }

    @RequestMapping(value = "/settings/course/add/success")
    public String showSuccessPage(Model model) {
        model.addAttribute("msg", "Course was successfully created !");
        return "common/success";
    }

    @RequestMapping("/settings/course/edit/{id}")
    public String showEditPage(@PathVariable("id") int courseId, Model model) {
        model.addAttribute("course", courseService.findById(courseId));
        return "course/courseEdit";
    }

    @RequestMapping("/courses/my")
    public String showUserCourses(@ModelAttribute("user") UserInfo userInfo, Model model) {
        model.addAttribute("courses", userService.findCourses(userInfo.getId()));
        return "course/courses";
    }

    @RequestMapping("/course/{id}/enroll")
    public String processEnrolment(@PathVariable("id") int courseId, @ModelAttribute("user") UserInfo userInfo,
                                   Model model) {
        userService.addCourse(userInfo.getId(), courseId);
        model.addAttribute("msg", "You have successfully enrolled !");
        model.addAttribute("courseId", courseId);
        return "course/successEnroll";
    }

    @RequestMapping("/course/{id}/learn")
    public String showActiveCourse(@PathVariable("id") int courseId, @ModelAttribute("user") UserInfo userInfo,
                                   Model model) {
        if (!userService.enrollInCourse(userInfo.getId(), courseId)) {
            return "redirect:/course/" + courseId;
        }
        model.addAttribute("course", courseService.findById(courseId));
        return "course/courseActive";
    }
}
