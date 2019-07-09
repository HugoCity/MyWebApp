package com.hwadee.service;

import com.hwadee.dao.UserDao;

public class UserService {
	UserDao udao=new UserDao();
	

	public boolean validUserinfo(String name,String pwd) {
		
		if(udao.getUserBynameandPwd(name, pwd)!=null) {
			return true;
		}else 
			return false;
		
	}

}
