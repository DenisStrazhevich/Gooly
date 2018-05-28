package com.strazhevich.gooly.controller;



import com.google.zxing.WriterException;
import com.strazhevich.gooly.model.Orders;
import com.strazhevich.gooly.service.OrderService;
import com.strazhevich.gooly.service.TablesService;
import com.strazhevich.gooly.service.UserService;
import com.strazhevich.gooly.service.impl.QrCode;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import java.io.IOException;
import java.util.Map;

@Controller
public class AccountController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private TablesService tablesService;
    @Autowired
    private QrCode qrCode;

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(Map<String,Object> map) throws IOException, WriterException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        Orders order;
        order = orderService.getOrderByNumber(username);
        if(order != null){
            map.put("myImage", Base64.encode(qrCode.getQRCodeImage(order.getOrderInstitutionName() + " " + order.getOrderTableNumber(),300,300)));
        }

        map.put("user",userService.findByUsername(username));
        map.put("orders",orderService.getOrderByNumber(username));
        return "account";
    }

    @RequestMapping(value = "/cancel_reservation",method = RequestMethod.POST)
    public String cancelReservation(@RequestParam("institutionName") String name, @RequestParam("tableNumber")int number){
        orderService.deleteOrderByInstitutionNameAndTableNumber(name,number);
        tablesService.clearTableStatusByTableNumber(number);
        return "redirect:/account";
    }
}
