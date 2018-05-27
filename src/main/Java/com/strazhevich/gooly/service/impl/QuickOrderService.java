package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.OrderDao;
import com.strazhevich.gooly.dao.TablesDao;
import com.strazhevich.gooly.model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

@Service
public class QuickOrderService  {
    @Autowired
    private TablesDao tablesDao;
    @Autowired
    private OrderDao orderDao;

    private Map<String,Object> map = new HashMap<>();

    @Transactional
    @Async
    public void cancelTask(String numbers){
        map.forEach((k,v)->{
            if(numbers.equals(k)){
                Timer timer = (Timer) v;
                timer.cancel();
            }
        });
    }

    @Transactional
    @Async
    public void quickOrder(Orders order,int number){
        long delay = 30000;

        TimerTask timerTask = new TimerTask() {
            @Override
            @Transactional
            public void run() {
                Thread.currentThread().setName(order.getVisitorPhonenumber() + order.getOrderTableNumber());
                try{
                    tablesDao.clearTableStatusByTableNumber(number);
                    orderDao.deleteOrderByInstitutionNameAndTableNumber(order.getOrderInstitutionName(),number);
                }catch (Exception e){
                    //tablesDao.clearTableStatusByTableNumber(number);
                }
            }
        };

        orderDao.saveOder(order);
        tablesDao.changeTableStatusByTableNumber(number);
        Timer timer = new Timer();
        timer.schedule(timerTask,delay);
        map.put(order.getVisitorPhonenumber() + String.valueOf(order.getOrderTableNumber()),timer);
    }


}
