package cn.zjh.spot.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.baidu.ueditor.ActionEnter;

public class FileAct extends HttpServlet{
	public FileAct(){
		super();
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type","text/html");
		ServletContext application = request.getServletContext();
		String rootPath = application.getRealPath("/");
		PrintWriter out = response.getWriter();
		System.out.println(rootPath);
		out.write(new ActionEnter( request,rootPath).exec());
	}
}
