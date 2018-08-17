package com.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.po.Message;
import com.po.User;
import com.service.IMessageService;

public class MessageAction extends ActionSupport {
	Message m;
	IMessageService messageService;
	List<Message> messageList;
	User u1;
	User u2;
	public User getU2() {
		return u2;
	}
	public void setU2(User u2) {
		this.u2 = u2;
	}
	public User getU1() {
		return u1;
	}
	public void setU1(User u1) {
		this.u1 = u1;
	}
	public List<Message> getMessageList() {
		return messageList;
	}
	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	public Message getM() {
		return m;
	}
	public void setM(Message m) {
		this.m = m;
	}
	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}
	/**
	 * 发送消息
	 * @return
	 */
	public String sendMessage(){
		messageService.sendMessage(m);
		return SUCCESS;
	}
	/**
	 * 获取消息
	 * @return
	 */
	public String queryMessage(){
		messageList=messageService.queryMessage();
		return SUCCESS;
	}
	/**
	 * 根据用户名获取聊天消息
	 * @return
	 */
	public String queryMessageByUsername(){
		messageList=messageService.queryMessageByUsername(u1, u2);
		return SUCCESS;
	}
}
