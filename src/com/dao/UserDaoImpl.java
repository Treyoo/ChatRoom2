package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.po.User;

public class UserDaoImpl implements IUserDao {

	SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(u);
		tx.commit();
		session.close();
	}
	@Override
	public List<User> queryUser(User u) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User u where u.username=? and u.password=?");
		query.setParameter(0, u.getUsername());
		query.setParameter(1, u.getPassword());
		@SuppressWarnings("unchecked")
		List<User> list=query.list();
		session.close();
		return list;
	}
	@Override
	public void updateUserStatus(User u,boolean online) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		User u2=(User)session.get(User.class, u.getId());
		u2.setOnline(online);
		if(online){//如果是上线，则需要修改最后登录时间
			u2.setLogintime(new Timestamp(System.currentTimeMillis()));
		}
		session.update(u2);
		tx.commit();
		session.close();
	}
	@Override
	public List<User> queryOnline() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User u where u.online=true");
		@SuppressWarnings("unchecked")
		List<User> list=query.list();
		session.close();
		return list;
	}
	@Override
	public List<User> searchUserByName(String keyword) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User u where u.username like ?");
		query.setParameter(0, "%"+keyword+"%");
		@SuppressWarnings("unchecked")
		List<User> list=query.list();
		session.close();
		return list;
	}
	@Override
	public User getUserInfoByName(String username) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("select new User(username,sex,age,online,logintime)"
				+ " from User u where u.username = ?");
		query.setParameter(0, username);
		@SuppressWarnings("unchecked")
		List<User> list=query.list();
		session.close();
		if(list.size()>0)
			return list.get(0);
		return null;
	}

}
