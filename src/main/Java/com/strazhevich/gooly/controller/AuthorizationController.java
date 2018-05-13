package com.strazhevich.gooly.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthorizationController {


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout){
        if (error != null){
            model.addAttribute("error","Username or password is uncorrect.");
        }
        if ((logout !=null)){
            model.addAttribute("message","Logget out successfully");
        }
        return "login";
    }
}
