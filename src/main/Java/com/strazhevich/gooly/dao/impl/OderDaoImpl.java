package com.strazhevich.gooly.dao.impl;

import com.strazhevich.gooly.dao.OrderDao;
import com.strazhevich.gooly.model.Orders;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OderDaoImpl implements OrderDao {

    SessionFactory sessionFactory;
    @Autowired
    public OderDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession(){
      return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveOder(Orders order) {
        currentSession().save(order);
    }

    @Override
    public Orders getOrderByNumber(String phoneNumber) {
        Query query = currentSession().createQuery("from Orders where visitorPhonenumber =:phoneNumber");
        query.setParameter("phoneNumber",phoneNumber);
        Orders orders = (Orders) query.uniqueResult();
        return orders;
    }
}