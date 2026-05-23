package com.bhushan.dao;

import com.bhushan.model.User;

public interface UserDao {

User findByUsername(String username);

    
    void save(User user);
}
