package com.strazhevich.gooly.dao;
import com.strazhevich.gooly.model.Review;
import java.util.List;

public interface ReviewDao {
    public void saveReview(Review review);
    public List<Review> getReviewByInstitutionName(String institutionName);
}
