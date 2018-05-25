package com.strazhevich.gooly.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "reservationDate")
    private Date reservationDate;

    @Column(name = "orderTime")
    private String orderTime;

    @Column(name = "visitorPhonenumber")
    private String visitorPhonenumber;

    @Column(name = "orderTableNumber")
    private int orderTableNumber;

    @Column(name = "countOfOderTables")
    private int countOfOderTables;

    @Column(name = "visitorName")
    private String visitorName;

    @Column(name = "visitorCount")
    private String visitorCount;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;



    @ManyToMany
    @JoinTable(name = "tables_orders",joinColumns = @JoinColumn(name = "orders_id"),
    inverseJoinColumns = @JoinColumn(name = "tables_id"))
    private Set<Tables> tables;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getVisitorPhonenumber() {
        return visitorPhonenumber;
    }

    public void setVisitorPhonenumber(String visitorPhonenumber) {
        this.visitorPhonenumber = visitorPhonenumber;
    }

    public int getOrderTableNumber() {
        return orderTableNumber;
    }

    public void setOrderTableNumber(int orderTableNumber) {
        this.orderTableNumber = orderTableNumber;
    }

    public int getCountOfOderTables() {
        return countOfOderTables;
    }

    public void setCountOfOderTables(int countOfOderTables) {
        this.countOfOderTables = countOfOderTables;
    }

    public String getVisitorName() {
        return visitorName;
    }

    public void setVisitorName(String visitorName) {
        this.visitorName = visitorName;
    }

    public String getVisitorCount() {
        return visitorCount;
    }

    public void setVisitorCount(String visitorCount) {
        this.visitorCount = visitorCount;
    }

    public Set<Tables> getTables() {
        return tables;
    }

    public void setTables(Set<Tables> tables) {
        this.tables = tables;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
