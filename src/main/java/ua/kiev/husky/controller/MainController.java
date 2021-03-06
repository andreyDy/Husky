package ua.kiev.husky.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.service.CourseService;

import java.util.List;


@Controller
public class MainController {

    private static final Logger LOGGER = LogManager.getLogger(MainController.class);

    @Autowired
    private CourseService courseService;

    @RequestMapping("/")
    public String index(Model model){
        final List<Course> allCourses = courseService.findAll();
        model.addAttribute("courses", allCourses);
        LOGGER.info("Found courses : " + allCourses);
        return "index";
    }

}
