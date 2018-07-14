package com.springmvc.dao;

import com.springmvc.model.User;
import com.springmvc.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

// 加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IUserDaoTest {

    @Autowired
    private UserMapper dao;

    @Test
    public void testSelectUser() throws Exception {
        int id = 1;
        User user = dao.selectByPrimaryKey(id);
        System.out.println(user.getUsername());
    }

    @Resource
    UserService userService;
    @Test
    public void test1(){
        System.out.println(userService.getUser(1).getUsername());
    }

    @Test
    public void test2(){
        String username="root";
        String password="123456";
        System.out.println(userService.checkUser(username,password));
    }
}