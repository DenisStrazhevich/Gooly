package com.strazhevich.gooly.controller;

import com.strazhevich.gooly.service.InstitutionService;
import com.strazhevich.gooly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.util.Map;

@Controller
public class InstitutionController {

    @Autowired
    private InstitutionService institutionService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/institution/bars", method = RequestMethod.GET)
    public String bars(Map<String,Object> map, @RequestParam("institutionType") String kind) {
        map.put("roles", userService.findAll());
        map.put("kindOfInstitution",kind);
        map.put("listOfInstitutions", institutionService.listOfInstitutions(kind));
        return "institution";
    }
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String seach(@RequestParam("searchText") String name, Map<String,Object> map){

        map.put("listOfInstitutions",institutionService.getByName(name));
        return "institution";
    }



}
