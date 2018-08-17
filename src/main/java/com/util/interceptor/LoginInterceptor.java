package com.util.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登录状态检查拦截器
 * @author CUI
 *
 */
public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> session=arg0.getInvocationContext().getSession();
		if(session.get("login")==null){
			return "deny";
		}else{
			return arg0.invoke();
		}
	}

}
