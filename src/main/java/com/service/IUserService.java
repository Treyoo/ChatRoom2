package com.service;

import java.util.List;

import com.po.User;

public interface IUserService {
	public void register(User u);
	public boolean login(User u);
	public void logout(User u);
	
	/**
	 * 查找所有在线用户
	 * @return List&lt;User&gt; 所有符合的User对象集合
	 */
	public List<User> queryOnline();
	
	/**
	 * 根据关键字模糊搜索用户名
	 * @param keyword 关键字
	 * @return List&lt;User&gt; 所有符合的User对象集合
	 */
	public List<User> searchUserByName(String keyword);
	
	/**
	 * 根据用户名获取用户资料
	 * @param username 用户名
	 * @return User对象
	 */
	public User getUserInfoByName(String username);
}
