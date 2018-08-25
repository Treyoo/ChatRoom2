package com.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.dao.IUserDao;
import com.opensymphony.xwork2.ActionContext;
import com.po.User;

public class UserServiceImpl implements IUserService {

	IUserDao userDao;
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	public IUserDao getUserDao() {
		return userDao;
	}
	@Override
	public void register(User u) {
		// TODO Auto-generated method stub
		userDao.addUser(u);
	}
	@Override
	public boolean login(User u) {
		// TODO Auto-generated method stub
		List<User> list=userDao.queryUser(u);
		if(list.size()>0&&!getOnlineUsername().contains(list.get(0).getUsername())){//若登录信息正确且未登录
			Map<String,Object> session=ActionContext.getContext().getSession();
			session.put("login", list.get(0));//登录成功，把用户对象保存到session中
			userDao.updateUserStatus(list.get(0), true);//更新用户为在线状态
			return true;
		}
		return false;
	}
	@Override
	public void logout(User u) {
		// TODO Auto-generated method stub
		if(u.getId()==null)return;
		ActionContext.getContext().getSession().remove("login");//把用户对象从session中移除
		userDao.updateUserStatus(u, false);
	}
	@Override
	public List<User> queryOnline() {
		// TODO Auto-generated method stub
		return userDao.queryOnline();
	}
	@Override
	public List<User> searchUserByName(String keyword) {
		// TODO Auto-generated method stub
		return userDao.searchUserByName(keyword);
	}
	@Override
	public User getUserInfoByName(String username) {
		// TODO Auto-generated method stub
		return userDao.getUserInfoByName(username);
	}
	@Override
	public Set<String> getOnlineUsername() {
		// TODO Auto-generated method stub
		return WebSocketServer.getWebSocketMap().keySet();
	}


}
