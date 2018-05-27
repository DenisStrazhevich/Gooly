package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.ReviewDao;
import com.strazhevich.gooly.model.Review;
import com.strazhevich.gooly.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewDao reviewDao;

    @Override
    @Transactional
    public void saveReview(Review review) {
        reviewDao.saveReview(review);
    }

    @Override
    @Transactional
    public List<Review> getReviewByInstitutionName(String institutionName) {
        return reviewDao.getReviewByInstitutionName(institutionName);
    }
}
