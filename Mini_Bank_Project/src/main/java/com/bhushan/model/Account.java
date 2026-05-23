package com.bhushan.model;

import java.io.Serializable;
import java.util.Date;


public class Account implements Serializable {

    private Long accountNo;
    private Long userId;
    private String accountHolder;
    private String accountType;   
    private Double balance;
    private String status;        
    private Date createdAt;

    
    public Account() {
    }

    
    public Account(Long accountNo,
                   Long userId,
                   String accountHolder,
                   String accountType,
                   Double balance,
                   String status,
                   Date createdAt) {
        this.accountNo = accountNo;
        this.userId = userId;
        this.accountHolder = accountHolder;
        this.accountType = accountType;
        this.balance = balance;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public Long getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(Long accountNo) {
        this.accountNo = accountNo;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAccountHolder() {
        return accountHolder;
    }

    public void setAccountHolder(String accountHolder) {
        this.accountHolder = accountHolder;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    // toString()
    @Override
    public String toString() {
        return "Account{" +
                "accountNo=" + accountNo +
                ", userId=" + userId +
                ", accountHolder='" + accountHolder + '\'' +
                ", accountType='" + accountType + '\'' +
                ", balance=" + balance +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}