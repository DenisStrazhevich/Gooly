package com.strazhevich.gooly.dao;

import com.strazhevich.gooly.model.Orders;

import java.util.List;

public interface OrderDao {
    public void saveOder(Orders order);
    public void deleteOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber );
    public Orders getOrderByNumber(String phoneNumber);
    public Orders getOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber);
    public List<Orders> getOrderListByInstitutionName(String name);
}
