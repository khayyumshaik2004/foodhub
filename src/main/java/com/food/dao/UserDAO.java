package com.food.dao;

import com.food.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email,String password);

    boolean updatePassword(String email,String password);
    boolean resetPassword(String email,String password);
}