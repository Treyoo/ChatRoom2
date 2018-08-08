package com.dao;

import java.util.List;

import com.po.Message;
import com.po.User;

public interface IMessageDao {
	public void addMessage(Message m);
	public List<Message> queryMessage();
	public List<Message> queryMessageByUsername(User fromuser,User touser);
}
