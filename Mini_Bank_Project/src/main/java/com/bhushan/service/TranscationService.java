package com.bhushan.service;

import java.util.List;

import com.bhushan.model.Transaction;

public interface TranscationService {

	 List<Transaction> getTransactionsByAccount(Long accountNo);
	 void saveTransaction(Transaction transaction);
}
