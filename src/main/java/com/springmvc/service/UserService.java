package com.springmvc.service;

import com.springmvc.model.User;

public interface UserService {

    public User getUser(int id);

    public int insertUser(User user);

    public int checkUser(String username,String password);

    public int updateUser(User user);
}
