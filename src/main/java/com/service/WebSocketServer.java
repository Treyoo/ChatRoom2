package com.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * WebSocket服务
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/ws/websocket/{username}")
public class WebSocketServer{
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;

	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	//private static CopyOnWriteArraySet<WebSocket> webSocketSet = new CopyOnWriteArraySet<WebSocket>();
	private static ConcurrentHashMap<String, WebSocketServer> webSocketMap=new ConcurrentHashMap<String, WebSocketServer>();


	//时间格式
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	/**
	 * 连接建立成功调用的方法
	 * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 * @param username 登录的用户名
	 */
	@OnOpen
	public void onOpen(Session session,@PathParam("username") String username){
		this.session = session;
		//webSocketSet.add(this);     //加入set中
		webSocketMap.put(username, this);
		addOnlineCount();           //在线数加1
		broadcast(username+"_login");
		System.out.println(username+"建立连接！当前在线人数为" + getOnlineCount());
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose(@PathParam("username") String username){
		//webSocketSet.remove(this);  //从set中删除
		webSocketMap.remove(username);
		subOnlineCount();           //在线数减1
		broadcast(username+"_logout");
		System.out.println(username+"关闭连接！当前在线人数为" + getOnlineCount());
	}

	/**
	 * 收到客户端消息后调用的方法
	 * @param message 客户端发送过来的消息
	 * @param session 可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		JSONObject obj=JSON.parseObject(message);
		obj.put("sendtime", sdf.format(new Date()));//设置消息发送时间
		broadcast(obj.toString());//群发
	}

	/**
	 * 发生错误时调用
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error){
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(String message) throws IOException{
		this.session.getBasicRemote().sendText(message);
		//this.session.getAsyncRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		WebSocketServer.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		WebSocketServer.onlineCount--;
	}
	
	public static ConcurrentHashMap<String, WebSocketServer> getWebSocketMap() {
		return webSocketMap;
	}
	
	/**
	 * 对所有在线用户(包括自己)广播消息
	 * @param msg 消息
	 */
	public void broadcast(String msg){
		for(WebSocketServer item:webSocketMap.values()){
			try {
				item.sendMessage(msg);
			} catch (IOException e) {
				e.printStackTrace();
				continue;
			}
		}
	}
	
	/**
	 * 对某个用户发送消息
	 * @param msgObj 消息JSON对象
	 */
	public void unicast(JSONObject msgObj){
		
		try {
			webSocketMap.get(msgObj.getString("fromuser")).sendMessage(msgObj.toString());
			if(webSocketMap.containsKey(msgObj.getString("touser"))){//若聊天对象已登录
				webSocketMap.get(msgObj.getString("touser")).sendMessage(msgObj.toString());
			}else{
				System.out.println("聊天用户不存在或未登录！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
