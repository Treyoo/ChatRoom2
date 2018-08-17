package com.service;

import java.sql.Timestamp;
import java.util.List;

import com.dao.IMessageDao;
import com.po.Message;
import com.po.User;

public class MessageServiceImpl implements IMessageService {

	IMessageDao messageDao;
	public IMessageDao getMessageDao() {
		return messageDao;
	}
	public void setMessageDao(IMessageDao messageDao) {
		this.messageDao = messageDao;
	}
	@Override
	public void sendMessage(Message m) {
		// TODO Auto-generated method stub
		m.setSendtime(new Timestamp(System.currentTimeMillis()));//设置发送时间为当前时间
		messageDao.addMessage(m);
	}
	@Override
	public List<Message> queryMessage() {
		// TODO Auto-generated method stub
		return messageDao.queryMessage();
	}
	@Override
	public List<Message> queryMessageByUsername(User fromuser, User touser) {
		// TODO Auto-generated method stub
		return messageDao.queryMessageByUsername(fromuser, touser);
	}

}
