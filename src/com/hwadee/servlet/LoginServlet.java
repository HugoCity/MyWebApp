package com.hwadee.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hwadee.service.UserService;

@WebServlet(value="/login/test.html",loadOnStartup=0,
initParams= {@WebInitParam(name = "charset", value = "utf-8")}) // ��������servlet�������ַ
public class LoginServlet extends HttpServlet {
	
	UserService userService=new UserService();
	
	private static final long serialVersionUID = 1L;
    String charset="";
	@Override
	public void init() throws ServletException {
	
		charset=this.getInitParameter("charset");
	}
	// ���캯��
	public LoginServlet() {
		super();
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginServlet GET �����������ˣ�");
		String name = request.getParameter("name");// �����ַ�����keyֵ
		String strage = request.getParameter("age");
		int age=Integer.parseInt(strage);

		response.setCharacterEncoding(charset);
		response.setContentType("text/html;charset="+charset);
		response.getWriter().append("��ӭ��:"+name+"��¼��");
		response.getWriter().append("<h1>���ص�����Age:<span style=\"color:red\">"+age+"</span></h1>");
	    
		ServletContext application = this.getServletContext();//���ServletContext
		Integer count=(Integer) application.getAttribute("count");
		if(count==null) {
			application.setAttribute("count", 1);
			count=(Integer) application.getAttribute("count");
			
		}else {
			application.setAttribute("count", count+1);
		}
		response.getWriter().append("���ǵڣ�"+count+"������");
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding(charset);
		response.setContentType("text/html;charset="+charset);
		String uname = request.getParameter("uname");// �����ַ�����keyֵ
		String upass = request.getParameter("upassword");
		String vali_user = request.getParameter("ValiImage");
		String vali_sys = request.getSession().getAttribute("Valicode").toString();
		if(userService.validUserinfo(uname, upass) && vali_user.toLowerCase().equals(vali_sys.toLowerCase())) {
			
			 HttpSession session=	request.getSession();
		     session.setAttribute("LOGINSTATE",uname);
		     response.sendRedirect(request.getContextPath()+ "/mainservlet.html");
			
			
		}else {
			//response.getWriter().append("<h1 style=\"color:red\" >��¼ʧ��</h1>");
			//request.getServletContext().getRequestDispatcher("/views/login.html");
		    //	request.getSession().setAttribute("failure", "true");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		
		}
		
	}

}
