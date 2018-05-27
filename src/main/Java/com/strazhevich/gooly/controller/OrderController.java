package com.strazhevich.gooly.controller;

import com.strazhevich.gooly.model.Orders;
import com.strazhevich.gooly.service.InstitutionService;
import com.strazhevich.gooly.service.OrderService;
import com.strazhevich.gooly.service.TablesService;
import com.strazhevich.gooly.service.UserService;
import com.strazhevich.gooly.service.impl.QuickOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    TablesService tablesService;
    @Autowired
    InstitutionService institutionService;
    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    @Autowired
    QuickOrderService quickOrderService;


    @RequestMapping(value = "/order", method = RequestMethod.GET )
    public String order(Map<String,Object> map, Model model, @RequestParam("institutionName") String name, @RequestParam("phone") String phone){
        map.put("order", new Orders());
        map.put("institutions", institutionService.getInstitutionByName(name));
        map.put("user",userService.findByUsername(phone));
        model.addAttribute("listTable", tablesService.listTablesByInstitutionName(name));

        return "order";
    }

    @RequestMapping(value = "/order/add", method = RequestMethod.POST)
    public String addOder(@ModelAttribute Orders order){
        int tableNumber;
        tableNumber = order.getOrderTableNumber();
        orderService.saveOder(order);
        tablesService.changeTableStatusByTableNumber(tableNumber);
        return "redirect:/account";
    }

    @RequestMapping(value = "/quickorder", method = RequestMethod.GET )
    public String quickorderPage(Map<String,Object> map, Model model, @RequestParam("institutionName") String name, @RequestParam("phone") String phone){
        map.put("order", new Orders());
        map.put("institutions", institutionService.getInstitutionByName(name));
        map.put("user",userService.findByUsername(phone));
        model.addAttribute("listTable", tablesService.listTablesByInstitutionName(name));

        return "quickorder";
    }

    @RequestMapping(value = "/quickorder", method = RequestMethod.POST)
    public String quickorder(@ModelAttribute Orders order){

        int tableNumber = order.getOrderTableNumber();

        quickOrderService.quickOrder(order,tableNumber);
        return "redirect:/welcome";
    }
}
