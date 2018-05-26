package com.strazhevich.gooly.controller.facilityAdministrator;

import com.strazhevich.gooly.model.Orders;
import com.strazhevich.gooly.service.InstitutionService;
import com.strazhevich.gooly.service.OrderService;
import com.strazhevich.gooly.service.TablesService;
import com.strazhevich.gooly.service.impl.QuickOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ConfirmQuickOrderController {
    @Autowired
    TablesService tablesService;
    @Autowired
    InstitutionService institutionService;
    @Autowired
    OrderService orderService;
    @Autowired
    QuickOrderService quickOrderService;

    @RequestMapping(value = "/confirm_order", method = RequestMethod.GET)
    public String getConfirmQuickOrderPage(Map<String,Object> map, Model model, @RequestParam("institutionName") String name){
        map.put("institutionName",name);
        map.put("institutions", institutionService.getInstitutionByName(name));
        model.addAttribute("listTable", tablesService.listTablesByInstitutionName(name));
        return "confirm_quick_order";
    }

    @RequestMapping(value = "/confirm_order",method = RequestMethod.POST)
    public String clearTableStatus(@RequestParam("institutionName") String institutionName,@RequestParam("tableNumber") int tableNumber){
        String phonenumber;
        Orders order = orderService.getOrderByInstitutionNameAndTableNumber(institutionName, tableNumber);
        phonenumber = order.getVisitorPhonenumber();
        quickOrderService.cancelTask(phonenumber + tableNumber);
        return "redirect:/welcome";
    }
}
