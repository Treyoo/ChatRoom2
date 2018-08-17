package com.service;

import java.util.List;

import com.po.Message;
import com.po.User;

public interface IMessageService {
	/**
	 * 发送消息
	 * @param m
	 */
	public void sendMessage(Message m);
	
	/**
	 * 获取全部消息
	 * @return List &lt;Message&gt;
	 */
	public List<Message> queryMessage();
	
	/**
	 * 获取与用户相关的消息
	 * @param fromuser 用户1
	 * @param touser 用户2
	 * @return List &lt;Message&gt;
	 */
	public List<Message> queryMessageByUsername(User fromuser, User touser);
}
