package com.bhushan.model;



import java.io.Serializable;
import java.util.Date;

/**
 * Model class representing a banking transaction.
 */
public class Transaction implements Serializable {

    private Long txnId;
    private Long accountNo;
    private String txnType;       // DEPOSIT, WITHDRAW, TRANSFER_IN, TRANSFER_OUT
    private Double amount;
    private String description;
    private Date txnDate;

    // Default Constructor
    public Transaction() {
    }

    // Parameterized Constructor
    public Transaction(Long txnId,
                       Long accountNo,
                       String txnType,
                       Double amount,
                       String description,
                       Date txnDate) {
        this.txnId = txnId;
        this.accountNo = accountNo;
        this.txnType = txnType;
        this.amount = amount;
        this.description = description;
        this.txnDate = txnDate;
    }

    // Getters and Setters
    public Long getTxnId() {
        return txnId;
    }

    public void setTxnId(Long txnId) {
        this.txnId = txnId;
    }

    public Long getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(Long accountNo) {
        this.accountNo = accountNo;
    }

    public String getTxnType() {
        return txnType;
    }

    public void setTxnType(String txnType) {
        this.txnType = txnType;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTxnDate() {
        return txnDate;
    }

    public void setTxnDate(Date txnDate) {
        this.txnDate = txnDate;
    }

    // toString()
    @Override
    public String toString() {
        return "Transaction{" +
                "txnId=" + txnId +
                ", accountNo=" + accountNo +
                ", txnType='" + txnType + '\'' +
                ", amount=" + amount +
                ", description='" + description + '\'' +
                ", txnDate=" + txnDate +
                '}';
    }
}