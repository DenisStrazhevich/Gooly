package com.strazhevich.gooly.controller.facilityAdministrator;

import com.strazhevich.gooly.service.InstitutionService;
import com.strazhevich.gooly.service.TablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ClearController {
    @Autowired
    TablesService tablesService;
    @Autowired
    InstitutionService institutionService;


    @RequestMapping(value = "/clear", method = RequestMethod.GET)
    public String clearTableStatusPage(Map<String,Object> map, Model model, @RequestParam("institutionName") String name){
        map.put("institutionName",name);
        map.put("institutions", institutionService.getInstitutionByName(name));
        model.addAttribute("listTable", tablesService.listTablesByInstitutionName(name));
        return "cleartable";
    }

    @RequestMapping(value = "/clear",method = RequestMethod.POST)
    public String clearTableStatus(@RequestParam("tableNumber") int tableNumber){
        tablesService.clearTableStatusByTableNumber(tableNumber);
        return "redirect:/welcome";
    }
}
