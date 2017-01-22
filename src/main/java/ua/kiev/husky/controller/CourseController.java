package ua.kiev.husky.controller;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.kiev.husky.exception.NameExistsException;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.Cover;
import ua.kiev.husky.model.User;
import ua.kiev.husky.security.CurrentUser;
import ua.kiev.husky.security.UserInfo;
import ua.kiev.husky.service.CourseService;
import ua.kiev.husky.service.UserService;
import ua.kiev.husky.validation.CourseForm;
import ua.kiev.husky.validation.validator.CourseFormTimeValidator;

import javax.validation.Valid;


@Controller
public class CourseController {

    private static final Logger LOGGER = LogManager.getLogger(CourseController.class);

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
        final Cover courseCover = new Cover(cover, courseForm.getName());
        final User teacher = userService.findByEmail(userInfo.getEmail());
        final Course course = new Course(courseForm, teacher, courseCover);
        try {
            courseService.createCourse(course);
            LOGGER.info("New course was created, name : " + course.getName());
        } catch (NameExistsException e) {
            LOGGER.warn("Can`t create new course : course name is not unique !", e);
            result.rejectValue("name", "valid.courseNameIsNotUnique");
            return "course/courseAdd";
        }
        return "redirect:/settings/course/add/success";
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
