package ua.kiev.husky.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.kiev.husky.exception.EmailExistsException;
import ua.kiev.husky.model.User;
import ua.kiev.husky.service.UserService;
import ua.kiev.husky.validation.RegistrationForm;

import javax.validation.Valid;


@Controller
@RequestMapping("/registration")
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String provideRegistrationForm(Model model) {
        model.addAttribute("registrationForm", new RegistrationForm());
        return "auth/registration";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processRegistrationForm(@Valid @ModelAttribute("registrationForm") RegistrationForm registrationForm,
                                          BindingResult result) {
        if (result.hasErrors()) {
            return "auth/registration";
        }

        if (!registerUser(registrationForm, result)) {
            return "auth/registration";
        }
        return "redirect:/registration/success";
    }

    private boolean registerUser(RegistrationForm form, BindingResult result) {
        try {
            userService.registerUser(new User(form));
            return true;
        } catch (EmailExistsException e) {
            result.rejectValue("email", "valid.emailIsNotUnique");
            return false;
        }
    }

    @RequestMapping(value = "/success")
    public String showSuccessPage() {
        return "auth/success";
    }
}
