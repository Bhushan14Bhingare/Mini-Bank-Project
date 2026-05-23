package com.bhushan.service;

import com.bhushan.model.User;


public interface AuthorService {

    
    User login(String username, String password);
}