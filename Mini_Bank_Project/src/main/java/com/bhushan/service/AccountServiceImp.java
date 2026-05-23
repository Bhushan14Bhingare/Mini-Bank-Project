package com.bhushan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bhushan.dao.AccountDao;
import com.bhushan.model.Account;
import com.bhushan.model.Transaction;

import java.util.Date;

@Service
public class AccountServiceImp implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private TransactionServiceImp transactionService;

    
    @Override
    public Account createAccount(Account account) {

        if (account == null) {
            throw new IllegalArgumentException("Account details cannot be null.");
        }

        if (account.getBalance() == null) {
            account.setBalance(0.0);
        }

        account.setStatus("ACTIVE");
        account.setCreatedAt(new Date());

        return accountDao.save(account);
    }

    
    @Override
    @Transactional
    public double deposit(Long accountNo, Double amount) {

        validateAmount(amount);

        Account account = getAccountByNumber(accountNo);

        double newBalance = account.getBalance() + amount;
        accountDao.updateBalance(accountNo, newBalance);

        saveTransaction(accountNo, "DEPOSIT", amount, "Amount deposited");

        return newBalance;
    }

   
    @Override
    @Transactional
    public double withdraw(Long accountNo, Double amount) {

        validateAmount(amount);

        Account account = getAccountByNumber(accountNo);

        if (account.getBalance() < amount) {
            throw new RuntimeException("Insufficient balance.");
        }

        double newBalance = account.getBalance() - amount;
        accountDao.updateBalance(accountNo, newBalance);

        saveTransaction(accountNo, "WITHDRAW", amount, "Amount withdrawn");

        return newBalance;
    }

    
    @Override
    public double getBalance(Long accountNo) {
        Account account = getAccountByNumber(accountNo);
        return account.getBalance();
    }

    
    @Override
    @Transactional
    public void transfer(Long fromAccountNo, Long toAccountNo, Double amount) {

        if (fromAccountNo.equals(toAccountNo)) {
            throw new RuntimeException("Source and destination accounts cannot be the same.");
        }

        validateAmount(amount);

        // Debit source account
        withdraw(fromAccountNo, amount);

        // Credit destination account
        deposit(toAccountNo, amount);

        // Additional transfer-specific transaction records
        saveTransaction(fromAccountNo, "TRANSFER_OUT", amount,
                "Transferred to Account No: " + toAccountNo);

        saveTransaction(toAccountNo, "TRANSFER_IN", amount,
                "Received from Account No: " + fromAccountNo);
    }

    /**
     * Retrieves account details by account number.
     */
    @Override
    public Account getAccountByNumber(Long accountNo) {

        Account account = accountDao.findByAccountNo(accountNo);

        if (account == null) {
            throw new RuntimeException("Account not found.");
        }

        if (!"ACTIVE".equalsIgnoreCase(account.getStatus())) {
            throw new RuntimeException("Account is not active.");
        }

        return account;
    }

    /**
     * Validates transaction amount.
     */
    private void validateAmount(Double amount) {
        if (amount == null || amount <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero.");
        }
    }

   
    private void saveTransaction(Long accountNo,
                                 String txnType,
                                 Double amount,
                                 String description) {

        Transaction transaction = new Transaction();
        transaction.setAccountNo(accountNo);
        transaction.setTxnType(txnType);
        transaction.setAmount(amount);
        transaction.setDescription(description);
        transaction.setTxnDate(new Date());

        transactionService.saveTransaction(transaction);
    }
}