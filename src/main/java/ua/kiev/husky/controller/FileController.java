package ua.kiev.husky.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ua.kiev.husky.service.CourseService;


@Controller
public class FileController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/image/{courseName}")
    @ResponseBody
    public byte[] getCover(@PathVariable("courseName") final int courseName){
        return courseService.findById(courseName).getCover().getFile();
    }
}
