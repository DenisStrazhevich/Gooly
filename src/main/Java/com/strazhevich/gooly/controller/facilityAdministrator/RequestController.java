package com.strazhevich.gooly.controller.facilityAdministrator;

import com.strazhevich.gooly.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class RequestController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/request", method = RequestMethod.GET)
    public String getRequestPage(Map<String,Object> map, @RequestParam("institutionName") String name ){
        map.put("order", orderService.getOrderListByInstitutionName(name));
        return "request";
    }

}
