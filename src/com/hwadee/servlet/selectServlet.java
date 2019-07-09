package com.hwadee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/FirstSql")
public class selectServlet extends HttpServlet{
	private static String jdbcDriver = "com.mysql.cj.jdbc.Driver";// mysql连接驱动,无需改
	
	public static String jdbcUrl = "jdbc:mysql://localhost:3306/dbtaobao?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
	public static String jdbcUser = "root";//数据库用户名
	public static String jdbcPwd = "123456";//数据库密码
	private static Connection conn;
	public static Statement st;
	
	static {
		try {
			Class.forName(jdbcDriver);// 加载mysql驱动类
			conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
			// 驱动利用驱动地址，数据库用户名，密码创建连接
			st = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//以上基本是固定格式的
	
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) //
			throws ServletException, IOException {
		List<Map> list =new ArrayList<Map>();//创建list集合用于存入map的键值对集合
		
		String user_id = request.getParameter("user_id");//接收到前台传来的数据
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String action = request.getParameter("action");
		String age_range = request.getParameter("age_range");
		String gender = request.getParameter("gender");
		String province = request.getParameter("province");
	
		String item_id = request.getParameter("item_id");
		String cat_id = request.getParameter("cat_id");
		String merchant_id = request.getParameter("merchant_id");
		String brand_id = request.getParameter("brand_id");
		
		try {
			
			String a = "select * from user_log where";
	
			
			
			String b = " ";
			if(user_id.equals("")) {;}	else{b=b + "and user_id=" ;}
			
			String c = " ";
			if(month.equals("")){;} else{c=c+"and month=";}
			
			String d = " ";
			if(day.equals("")){;} else{d=d+"and day=";}
				
			String e = " ";
			if(action.equals("")){;}else {e=e+"and action=";}
			
			String f = " ";
			if(age_range.equals("")){;} else{f=f+"and age_range=";}
			
			String g = " ";
			if(gender.equals("")){;} else{g=g+"and gender=";}
			
			String h = " ";
			if(province.equals("")){;} else{h=h+"and province=";}
			
			String i = " ";
			if(item_id.equals("")){;} else{i=i+"and item_id=";}
			String j = " ";
			if(cat_id.equals("")){;} else{j=j+"and cat_id=";}
			String k = " ";
			if(merchant_id.equals("")){;} else{k=k+"and merchant_id=";}
			String l = " ";
			if(brand_id.equals("")){;} else{l=l+"and brand_id=";}
		
			String sql ="select * from user_log where 1=1"
			+b+user_id
			+c+month
			+d+day
			+e+action
			+f+age_range
			+g+gender
			+h+province
			+i+item_id
			+j+cat_id
			+k+merchant_id
			+l+brand_id+" limit 500";
			
//			String sql ="select * from user_log where user_id="+user_id+
//					" and item_id="+item_id+
//					" and cat_id="+cat_id+
//					" and merchant_id="+merchant_id+
//					" and brand_id="+brand_id+
//					" and month="+month+
//					" and day="+day;
			//复制之前的sql代码    每行必须要转换为字符串然后加上换行符
			//idcard_w是用户传入的数据用于查询用户需要的信息
			
			ResultSet rs = st.executeQuery(sql);
			//从数据库读取的内容，返回一个结果集。
			System.out.println("获取数据");
			while (rs.next()) {
				String user = rs.getString("user_id");				
				String Mon = rs.getString("month");
				String Day = rs.getString("day");
				String Action = rs.getString("action");
				String Age_range = rs.getString("age_range");
				String Gender = rs.getString("gender");
				String Province = rs.getString("province");
				
				String item = rs.getString("item_id");
				String cat = rs.getString("cat_id");
				String merchant = rs.getString("merchant_id");
				String brand = rs.getString("brand_id");
				//获取用循环接收数据库的表格信息
				
				Map map = new HashMap(); 
				map.put("user_id", user);			
				map.put("action", Action);		
				map.put("age_range", Age_range);
				map.put("gender", Gender);			
				map.put("province", Province);		
				map.put("month", Mon);
				map.put("day", Day);	
				
				map.put("item_id", item);	
				map.put("cat_id", cat);	
				map.put("merchant_id", merchant);	
				map.put("brand_id", brand);	
				
				//用键值对存入到map集合中
				System.out.println(map);
				list.add(map);//在将map集合对象存入list集合
				System.out.println("放入集合");
				for (Map map_1 :list) {
					System.out.println(map_1);
				}//在打印台遍历出数据查看是否有错误
				
			}//遍历结果集
		} catch (Exception e) {
			e.printStackTrace();
		}
	
 
		System.out.println("跳转");
		request.setAttribute("key_list",list);//将list集合数据放入到request中共享
		request.getRequestDispatcher("/select.jsp").forward(request, response);
		//跳转到index.jsp页面
	}
}