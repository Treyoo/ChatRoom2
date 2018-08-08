package com.dao;

import java.util.List;

import com.po.User;

public interface IUserDao {
	/**
	 * 增加用户
	 * @param u 用户对象
	 */
	public void addUser(User u);
	
	/**
	 * 根据用户名和密码查找用户对象
	 * @param u 用户对象
	 * @return List&lt;User&gt; 所有符合的User对象集合
	 */
	public List<User> queryUser(User u);
	
	/**
	 * 更新用户状态
	 * @param u 需修改状态的用户
	 * @param online 真:在线，假:离线
	 */
	public void updateUserStatus(User u,boolean online);

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
	 * 根据用户名获取用户信息
	 * @param username 用户名
	 * @return User
	 */
	public User getUserInfoByName(String username);
}
