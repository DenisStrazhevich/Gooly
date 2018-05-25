package com.strazhevich.gooly.controller;



import com.strazhevich.gooly.service.OrderService;
import com.strazhevich.gooly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.Map;

@Controller
public class AccountController {
    @Autowired
    UserService userService;

    @Autowired
    OrderService orderService;


    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account( Map<String,Object> map){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        map.put("user",userService.findByUsername(username));
        map.put("orders",orderService.getOrderByNumber(username));
        return "account";
    }
}
