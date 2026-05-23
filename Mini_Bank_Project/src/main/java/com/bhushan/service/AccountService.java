package com.bhushan.service;

import com.bhushan.model.Account;


public interface AccountService {

  
    Account createAccount(Account account);

    
    double deposit(Long accountNo, Double amount);

   
    double withdraw(Long accountNo, Double amount);

   
    double getBalance(Long accountNo);

    
    void transfer(Long fromAccountNo, Long toAccountNo, Double amount);

    
   
    Account getAccountByNumber(Long accountNo);
}