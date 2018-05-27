package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.OrderDao;
import com.strazhevich.gooly.model.Orders;
import com.strazhevich.gooly.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao;

    @Override
    @Transactional
    public void saveOder(Orders order) {
        orderDao.saveOder(order);
    }

    @Override
    @Transactional
    public void deleteOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber) {
        orderDao.deleteOrderByInstitutionNameAndTableNumber(institutionName,tableNumber);
    }


    @Override
    @Transactional
    public Orders getOrderByNumber(String phoneNumber) {
        return orderDao.getOrderByNumber(phoneNumber);
    }

    @Override
    @Transactional
    public Orders getOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber) {
        return orderDao.getOrderByInstitutionNameAndTableNumber(institutionName,tableNumber);
    }
}
