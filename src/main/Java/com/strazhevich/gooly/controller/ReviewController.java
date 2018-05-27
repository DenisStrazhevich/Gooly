package com.strazhevich.gooly.controller;

import com.strazhevich.gooly.model.Institution;
import com.strazhevich.gooly.model.Orders;
import com.strazhevich.gooly.model.Review;
import com.strazhevich.gooly.service.InstitutionService;
import com.strazhevich.gooly.service.OrderService;
import com.strazhevich.gooly.service.ReviewService;
import com.strazhevich.gooly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;
    @Autowired
    private UserService userService;
    @Autowired
    private InstitutionService institutionService;

    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String getReviewPage(@RequestParam("institutionName") String institutionName, Map<String,Object> map){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        Institution institution = institutionService.getInstitutionByName(institutionName);
        map.put("institution",institution);
        map.put("review", new Review());
        map.put("user", userService.findByUsername(username));
        map.put("reviewList", reviewService.getReviewByInstitutionName(institutionName));
        return "review";
    }


    @RequestMapping(value = "/review",method = RequestMethod.POST)
    public String addReview(@ModelAttribute Review review){
        reviewService.saveReview(review);
        return "redirect:/welcome";
    }

}
