package com.bhushan.dao;



import java.util.List;

import com.bhushan.model.Transaction;


public interface TranscationDao {

   
    void save(Transaction transaction);

    
    List<Transaction> findByAccountNo(Long accountNo);
}