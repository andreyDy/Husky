package ua.kiev.husky.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.kiev.husky.exception.NameExistsException;
import ua.kiev.husky.model.Module;
import ua.kiev.husky.security.CurrentUser;
import ua.kiev.husky.security.UserInfo;
import ua.kiev.husky.service.CourseService;
import ua.kiev.husky.validation.ModuleForm;

import javax.validation.Valid;


@Controller
public class ModuleController {

    @Autowired
    private CourseService courseService;

    @ModelAttribute("user")
    UserInfo findUserInfo(@CurrentUser UserInfo userInfo){
        return userInfo;
    }

    @RequestMapping("/course/{courseId}/module/{moduleId}")
    public String showModule(@PathVariable("courseId") int courseId, @PathVariable("moduleId") int moduleId,
                             Model model) {
        model.addAttribute("module", courseService.findModuleById(moduleId));
        return "module/module";
    }

    @RequestMapping("/settings/module/add")
    public String provideModuleForm(@RequestParam(value = "courseId") int courseId, Model model) {
        model.addAttribute("courseId", courseId);
        model.addAttribute ("moduleForm", new ModuleForm());
        return "module/moduleAdd";
    }

    @RequestMapping(value = "/settings/module/add", method = RequestMethod.POST)
    public String processModuleForm(@Valid @ModelAttribute ModuleForm moduleForm, BindingResult result,
                                    @RequestParam(value = "courseId") int courseId, Model model){
        if (result.hasErrors() || !createModule(moduleForm, courseId, result)) {
            model.addAttribute("courseId", courseId);
            return "module/moduleAdd";
        }
        return "redirect:/module/add/success";
    }

    private boolean createModule(ModuleForm moduleForm, int courseId, BindingResult result) {
        try {
            courseService.addModule(new Module(moduleForm), courseId);
            return true;
        } catch (NameExistsException e) {
            result.rejectValue("name", "valid.moduleNameIsNotUnique");
            return false;
        }
    }

    @RequestMapping(value = "/module/add/success")
    public String showSuccessPage(Model model) {
        model.addAttribute("msg", "Module was successfully created !");
        return "common/success";
    }
}
