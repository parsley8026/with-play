package com.parsley.service;

import com.parsley.domain.User;

public interface UserService {

    /**
     * 用户注册
     */
    public boolean addUser(User user);

    /**
     * 登录验证
     */
    public int login(String username,String password);

    /**
     * 检查username是否存在
     * @param username
     * @return 1:存在 0:不存在
     */
    public boolean existUsername(String username);

    /**
     * 获取用户信息
     * @param username
     * @return User
     */
    public User getUserByUsername(String username);


    /**
     * 获取用户信息
     * @param id
     * @return User
     */
    public User getUserById(Integer id);

    /**
     * 获取用户数
     */
    public int getUserCount();

    public boolean updateUser(User user);
}
