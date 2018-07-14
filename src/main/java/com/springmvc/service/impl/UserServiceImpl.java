package com.springmvc.service.impl;

import com.springmvc.dao.UserMapper;
import com.springmvc.model.User;
import com.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUser(int id){
        User user=userMapper.selectByPrimaryKey(id);
        return user;
    }

    @Override
    public int insertUser(User user){
        return this.userMapper.insert(user);
    }

    @Override
    public int checkUser(String username, String password) {
        Map map = new HashMap();
        map.put("username",username);
        map.put("password",password);
        User user=userMapper.selectByUsernamepassword(map);
        if(user!=null){
            return user.getId();
        }
        else{
            return -1;
        }
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }
}