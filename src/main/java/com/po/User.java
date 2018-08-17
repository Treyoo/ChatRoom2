package com.po;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String sex;
	private Integer age;
	private Boolean online;
	private Timestamp logintime;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public User(String username, String password, String sex, Integer age, Boolean online, Timestamp logintime) {
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.age = age;
		this.online = online;
		this.logintime = logintime;
	}
	/** 只初始化用户名的构造器,用于HQL查询 */
	public User(String username) {
		this.username = username;
	}
	/** 不带密码属性构造器,用于HQL查询 */
	public User(String username,String sex, Integer age, Boolean online, Object logintime) {
		this.username = username;
		this.sex = sex;
		this.age = age;
		this.online = online;
		this.logintime = stringToTimestamp(logintime.toString());//Timestamp要注意此处的类型转换
	}
	/**
	 * 字符串转时间戳
	 * @param dateStr
	 * @return
	 */
	public static Timestamp stringToTimestamp(String dateStr){
		 
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Calendar cal = Calendar.getInstance();
		   try {
		    Date date = sdf.parse(dateStr);
		    date.getTime();
		    cal.setTime(date);
		    return new Timestamp(cal.getTimeInMillis());
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		 
		   cal.setTime(new Date());
		   return new Timestamp(cal.getTimeInMillis());
	}
	
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Boolean getOnline() {
		return this.online;
	}

	public void setOnline(Boolean online) {
		this.online = online;
	}

	public Timestamp getLogintime() {
		return this.logintime;
	}

	public void setLogintime(Timestamp logintime) {
		this.logintime = logintime;
	}

}