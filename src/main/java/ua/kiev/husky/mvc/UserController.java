package ua.kiev.husky.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.kiev.husky.model.User;
import ua.kiev.husky.security.CurrentUser;
import ua.kiev.husky.security.UserInfo;
import ua.kiev.husky.service.UserService;
import ua.kiev.husky.validation.UserForm;

import javax.validation.Valid;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserDetailsService userDetailsService;

    @ModelAttribute("user")
    UserInfo findUserInfo(@CurrentUser UserInfo userInfo){
        return userInfo;
    }

    @RequestMapping("/profile")
    public String provideUserForm(@ModelAttribute("user") UserInfo userInfo, Model model){
        model.addAttribute("userForm", userService.findByEmail(userInfo.getEmail()));
        return "user/profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String processUserForm(@Valid @ModelAttribute("userForm") UserForm userForm, BindingResult result,
                                  @ModelAttribute("user") UserInfo userInfo){
        if (result.hasErrors()) {
            return "user/profile";
        }
        userService.update(new User(userForm, userInfo.getEmail()));
        reloadSecurityContext(userInfo);
        return "redirect:/profile";
    }

    private void reloadSecurityContext(UserInfo userInfo) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(userInfo.getEmail());
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(), userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}
