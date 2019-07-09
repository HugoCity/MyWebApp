package com.hwadee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.hwadee.entity.UserEntity;
import com.hwadee.tools.DButils;

public class UserDao {
	

	public UserEntity getUserBynameandPwd(String name,String pwd) {
		String sql="select * from employee where name='"+name+"' and password='"+pwd+"'";
		ResultSet rs= DButils.executeQuery(sql);
		if(rs==null)
			return null;
		else {
			try {
				if(rs.next())
				{
					UserEntity ue=new UserEntity();
					ue.setId(rs.getInt("id"));
					ue.setName(rs.getString("name"));
					ue.setPassword(rs.getString("password"));
					ue.setEmail(rs.getString("email"));
					ue.setBirthday(rs.getDate("birthday"));
					return ue;
					
				}else 
					return null;
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return null;
		
	}

}
