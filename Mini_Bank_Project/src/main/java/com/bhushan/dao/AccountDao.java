package com.bhushan.dao;

import com.bhushan.model.Account;

public interface AccountDao {
    Account save(Account account);

    
    Account findByAccountNo(Long accountNo);

   
    void updateBalance(Long accountNo, Double balance);
}