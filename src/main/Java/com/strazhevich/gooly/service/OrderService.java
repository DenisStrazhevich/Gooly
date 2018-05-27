package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Orders;

public interface OrderService {
    public void saveOder(Orders order);
    public void deleteOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber );
    public Orders getOrderByNumber(String phoneNumber);
    public Orders getOrderByInstitutionNameAndTableNumber(String institutionName, int tableNumber);
}
