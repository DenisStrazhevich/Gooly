package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.OrderDao;
import com.strazhevich.gooly.dao.TablesDao;
import com.strazhevich.gooly.model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Timer;
import java.util.TimerTask;

@Service
public class QuickOrderService  {
    @Autowired
    private TablesDao tablesDao;
    @Autowired
    private OrderDao orderDao;
    private long delay = 10000;

    @Transactional
    @Async
    public void quickOrder(Orders order,int number){

        TimerTask timerTask = new TimerTask() {
            @Override
            @Transactional
            public void run() {
                //testik();
                //timer.cancel();
                Thread.currentThread().setName(order.getVisitorPhonenumber());
                try{
                    tablesDao.clearTableStatusByTableNumber(number);
                }catch (Exception e){
                    //tablesDao.clearTableStatusByTableNumber(number);
                }
            }
        };
        orderDao.saveOder(order);
        tablesDao.changeTableStatusByTableNumber(number);
        Timer timer = new Timer();
        timer.schedule(timerTask,delay);

       // if(status == 1){
        //    tablesDao.clearTableStatusByTableNumber(number);
       // }
        //status = 0;

        //myTimer.setNumber(number);
        //myTimer.setTimer(timer);
        //timer.schedule(new MyTimer(),delay);
        //tablesDao.clearTableStatusByTableNumber(number);
    }



    /* @Async
    @Transactional
    public void doSomth(Orders order, int number){
        orderDao.saveOder(order);
        tablesDao.changeTableStatusByTableNumber(number);
        try{
            Thread.sleep(10000);
        }catch (InterruptedException e){

        }
        tablesDao.clearTableStatusByTableNumber(number);
    }
*/


}
