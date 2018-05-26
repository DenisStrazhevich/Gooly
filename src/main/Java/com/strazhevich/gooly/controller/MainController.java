package com.strazhevich.gooly.controller;


import com.strazhevich.gooly.service.impl.QuickOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @Autowired
    QuickOrderService quickOrderService;

    @RequestMapping(value = {"/", "/welcome"},method = RequestMethod.GET)
    public String welcome(Model model){
        return "welcome";
    }



    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model){
        return "admin";
    }
}
