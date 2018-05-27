package com.strazhevich.gooly.dao.impl;

import com.strazhevich.gooly.dao.ReviewDao;
import com.strazhevich.gooly.model.Review;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class ReviewDaoImpl implements ReviewDao {

    private SessionFactory sessionFactory;
    @Autowired
    public ReviewDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveReview(Review review) {
        currentSession().save(review);

    }

    @Override
    public List<Review> getReviewByInstitutionName(String institutionName) {
        Query query = currentSession().createQuery("select r from Review r inner join r.institution where r.institution.name = :name ");
        query.setParameter("name",institutionName);
        List<Review> reviews = query.list();
        return reviews;
    }
}
