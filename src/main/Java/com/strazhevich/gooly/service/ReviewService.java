package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Review;

import java.util.List;

public interface ReviewService {
    public void saveReview(Review review);
    public List<Review> getReviewByInstitutionName(String institutionName);
}
