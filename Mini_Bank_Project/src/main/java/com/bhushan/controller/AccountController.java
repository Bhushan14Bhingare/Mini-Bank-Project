package com.bhushan.controller;


import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bhushan.model.Account;
import com.bhushan.service.AccountService;


@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    
    @GetMapping("/dashboard")
    public String showDashboard() {
        return "dashboard";
    }

    
    @GetMapping("/create")
    public String showCreateAccountPage(Model model) {
        model.addAttribute("account", new Account());
        return "create-account";
    }

    
    @PostMapping("/create")
    public String createAccount(@ModelAttribute("account") @Valid Account account,
                                Model model) {
        try {
            Account savedAccount = accountService.createAccount(account);
            model.addAttribute("successMessage",
                    "Account created successfully! Account Number: "
                            + savedAccount.getAccountNo());
            model.addAttribute("account", new Account());
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "create-account";
    }

    
    @GetMapping("/deposit")
    public String showDepositPage() {
        return "deposit";
    }

    
    @PostMapping("/deposit")
    public String deposit(@RequestParam("accountNo") Long accountNo,
                          @RequestParam("amount") Double amount,
                          Model model) {
        try {
            double newBalance = accountService.deposit(accountNo, amount);
            model.addAttribute("successMessage",
                    "Deposit successful. Updated Balance: ₹" + newBalance);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "deposit";
    }

    
    @GetMapping("/withdraw")
    public String showWithdrawPage() {
        return "withdraw";
    }

    
    @PostMapping("/withdraw")
    public String withdraw(@RequestParam("accountNo") Long accountNo,
                           @RequestParam("amount") Double amount,
                           Model model) {
        try {
            double newBalance = accountService.withdraw(accountNo, amount);
            model.addAttribute("successMessage",
                    "Withdrawal successful. Updated Balance: ₹" + newBalance);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "withdraw";
    }

    
    @GetMapping("/balance")
    public String showBalancePage() {
        return "balance";
    }

    
    @PostMapping("/balance")
    public String checkBalance(@RequestParam("accountNo") Long accountNo,
                               Model model) {
        try {
            double balance = accountService.getBalance(accountNo);
            model.addAttribute("balance",
                    "Current Balance: ₹" + balance);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "balance";
    }

   
    @GetMapping("/transfer")
    public String showTransferPage() {
        return "transfer";
    }

    
    @PostMapping("/transfer")
    public String transfer(@RequestParam("fromAccountNo") Long fromAccountNo,
                           @RequestParam("toAccountNo") Long toAccountNo,
                           @RequestParam("amount") Double amount,
                           Model model) {
        try {
            accountService.transfer(fromAccountNo, toAccountNo, amount);
            model.addAttribute("successMessage",
                    "Fund transfer completed successfully.");
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "transfer";
    }

    
    @GetMapping("/details")
    public String getAccountDetails(@RequestParam("accountNo") Long accountNo,
                                    Model model) {
        try {
            Account account = accountService.getAccountByNumber(accountNo);
            model.addAttribute("accountDetails", account);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "account-details";
    }
    
    @GetMapping("/searchDetails")
    public String showAccountDetailsSearchPage() {

        return "search-account";
    }
}