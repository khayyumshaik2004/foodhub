package com.food.model;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class Order {
    private int id;
    private String customerName;
    private String mobile;
    private String address;
    private String paymentType;
    private double totalAmount;
    private Date orderDate;
    private List<OrderItem> items;

    public Order() {
        items = new ArrayList<>();
    }

    public Order(String customerName, String mobile, String address, String paymentType, double totalAmount) {
        this.customerName = customerName;
        this.mobile = mobile;
        this.address = address;
        this.paymentType = paymentType;
        this.totalAmount = totalAmount;
        this.items = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
