package com.action;

import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionSupport;
import com.po.User;
import com.service.IUserService;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	User u;
	IUserService userService;
	String info;
	List<User> userList;
	Set<String> onlineSet;
	
	public Set<String> getOnlineSet() {
		return onlineSet;
	}
	public void setOnlineSet(Set<String> onlineSet) {
		this.onlineSet = onlineSet;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public User getU() {
		return u;
	}
	public void setU(User u) {
		this.u = u;
	}
	
	public String register(){
		userService.register(u);
		return SUCCESS;
	}
	public String login(){
		if(userService.login(u)){
			
			return SUCCESS;
		}
		info="用户名或密码错误！";
		return INPUT;
	}
	public String logout(){
		userService.logout(u);
		return SUCCESS;
	}
	public String queryOnline(){
		userList=userService.queryOnline();
		return SUCCESS;
	}
	public String searchUserByName(){
		userList=userService.searchUserByName(u.getUsername());
		return SUCCESS;
	}
	public String getUserInfoByName(){
		u=userService.getUserInfoByName(u.getUsername());
		return SUCCESS;
	}
	/**验证用户名是否存在*/
	public String validateUsername(){
		if(userService.getUserInfoByName(u.getUsername())!=null){
			info="has";
		}else{
			info="no";
		}
		return SUCCESS;
	}
	/**获取所有websocket在线用户的用户名*/
	public String getOnlineUsername(){
		onlineSet=userService.getOnlineUsername();
		return SUCCESS;
	}
}
