package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Orders;

public interface OrderService {
    public void saveOder(Orders order);
    public Orders getOrderByNumber(String phoneNumber);
}
