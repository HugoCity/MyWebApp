package com.hwadee.tools;
/**
 * ���ݿ�������
 * @author Administrator
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DButils {
	static String jdbcurl="jdbc:mysql://localhost:3306/dbtaobao?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
	static String username="root";
	static String password="123456";
	static String drivername="com.mysql.cj.jdbc.Driver";
	
	//��̬��������ִ��
	static {
		
		try {
			Class.forName(drivername);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	static public  Connection getConnection() {
		try {
			Connection con = DriverManager.getConnection(jdbcurl, username, password);
		    return con;
		} catch (SQLException e) {
			return null;
		}
	}
	
	//��ȡ����
static	public ResultSet executeQuery(String sql) {
		try {
			Connection  conn = getConnection();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException ex) {
			System.err.println("sql_data.executeQuery:" + ex.getMessage());
		}
		return null;
	}
	//�������
	static public void executeInsert(String sql) {
		try {// conn = DriverManager.getConnection(url,user,password);
			Connection conn =getConnection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ex) {
			System.err.println("sql_data.executeUpdate:" + ex.getMessage());
		}
	}
	//�޸�����
	//ɾ������
	
	
	

	

}
