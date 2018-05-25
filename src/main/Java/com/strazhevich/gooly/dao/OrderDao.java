package com.strazhevich.gooly.dao;

import com.strazhevich.gooly.model.Orders;

public interface OrderDao {
    public void saveOder(Orders order);
    public Orders getOrderByNumber(String phoneNumber);
}
