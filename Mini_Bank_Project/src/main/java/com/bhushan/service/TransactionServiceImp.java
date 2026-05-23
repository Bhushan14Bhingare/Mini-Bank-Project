package com.bhushan.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bhushan.dao.TransactionDaoImpl;
import com.bhushan.model.Transaction;

@Service
public class TransactionServiceImp implements TranscationService{

	  @Autowired
	    private TransactionDaoImpl transactionDao;

	    
	    @Override
	    public List<Transaction> getTransactionsByAccount(Long accountNo) {
	        return transactionDao.findByAccountNo(accountNo);
	    }

	    
	    @Override
	    public void saveTransaction(Transaction transaction) {
	        if (transaction == null) {
	            throw new IllegalArgumentException("Transaction cannot be null.");
	        }

	        if (transaction.getTxnDate() == null) {
	            transaction.setTxnDate(new Date());
	        }

	        transactionDao.save(transaction);
	    }

}
