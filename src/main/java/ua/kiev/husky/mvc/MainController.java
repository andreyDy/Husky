package ua.kiev.husky.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.kiev.husky.service.CourseService;


@Controller
public class MainController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("courses", courseService.findAll());
        return "index";
    }

}
