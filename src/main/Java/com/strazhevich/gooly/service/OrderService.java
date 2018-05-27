package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Orders;

import java.util.List;

public interface OrderService {
    public void saveOder(Orders order);
    public void deleteOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber );
    public Orders getOrderByNumber(String phoneNumber);
    public Orders getOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber);
    public List<Orders> getOrderListByInstitutionName(String name);
}
