package com.bhushan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bhushan.dao.UserDao;
import com.bhushan.model.User;


@Service
public class AuthorServiceImp implements AuthorService {

    @Autowired
    private UserDao userDao;

    
    @Override
    public User login(String username, String password) {

        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Username is required.");
        }

        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password is required.");
        }

        User user = userDao.findByUsername(username.trim());

        if (user == null) {
            return null;
        }

        // Plain-text password comparison for educational purposes.
        // In production, always use BCrypt or another secure password hashing method.
        if (!user.getPassword().equals(password)) {
            return null;
        }

        return user;
    }
}