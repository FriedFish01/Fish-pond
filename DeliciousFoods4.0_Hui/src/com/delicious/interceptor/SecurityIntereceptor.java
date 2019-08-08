package com.delicious.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.delicious.entity.Users;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class SecurityIntereceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Users users = (Users) session.getAttribute("users");
		if(users == null){
			//û��¼
			return "error";
		}
		else if(users.getIdAdmin()==1){
			//��ͨ�û���¼
			return "error";
		}
		else{
			//����Ա��¼
			return invocation.invoke();
		}
		
	}
	
}
