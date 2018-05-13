package com.strazhevich.gooly.controller;

import com.strazhevich.gooly.Validator.UserValidator;
import com.strazhevich.gooly.model.User;
import com.strazhevich.gooly.service.SecurityService;
import com.strazhevich.gooly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {


    @RequestMapping(value = {"/", "/welcome"},method = RequestMethod.GET)
    public String welcome(Model model){
        return "welcome";
    }



    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model){
        return "admin";
    }
}
