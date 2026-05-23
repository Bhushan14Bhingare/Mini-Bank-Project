package com.bhushan.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bhushan.model.User;
import com.bhushan.service.AuthorService;


import jakarta.servlet.http.HttpSession;


@Controller
public class AuthController {

    @Autowired
    private AuthorService authService;

    
    @GetMapping("/")
    public String showLoginPage(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        try {
            User user = authService.login(username, password);

            if (user != null) {
                session.setAttribute("loggedInUser", user);
                return "redirect:/account/dashboard";
            } else {
                model.addAttribute("errorMessage", "Invalid username or password.");
            }

        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
        }

        return "login";
    }

   
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}