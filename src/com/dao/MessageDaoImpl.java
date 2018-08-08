package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.po.Message;
import com.po.User;

public class MessageDaoImpl implements IMessageDao {

	SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void addMessage(Message m) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tx= session.beginTransaction();
		session.save(m);
		tx.commit();
		session.close();
	}
	@Override
	public List<Message> queryMessage() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Message");
		@SuppressWarnings("unchecked")
		List<Message> messageList=query.list();
		session.close();
		return messageList;
	}
	@Override
	public List<Message> queryMessageByUsername(User fromuser, User touser) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Message m where m.fromuser=? and m.touser=? "
				+ "or m.fromuser=? and m.touser=?");
		query.setParameter(0, fromuser.getUsername());
		query.setParameter(1, touser.getUsername());
		query.setParameter(2, touser.getUsername());
		query.setParameter(3, fromuser.getUsername());
		@SuppressWarnings("unchecked")
		List<Message> messageList=query.list();
		session.close();
		return messageList;
	}

}
