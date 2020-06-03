package cn.zjh.spot.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import cn.zjh.spot.entity.User;


public class LoginFilter extends HttpServlet implements Filter{
	public FilterConfig config;
	public boolean isContains(String container,String[] regx){
		boolean result = false;
		for(int i = 0;i<regx.length;i++){
			if(container.indexOf(regx[i])!=-1){
				return true;
			}
		}
		return result;
	}
	@Override
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException{
		HttpServletRequest hrequest = (HttpServletRequest)request;
		String ctx=hrequest.getContextPath();   
		String uri=hrequest.getRequestURI();
		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse)response);
		String redirectPath = ctx + config.getInitParameter("redirectPath");
		String excludeStrings = config.getInitParameter("excludeStrings");
		String[] excludeList = excludeStrings.split(";");
		if(this.isContains(uri, excludeList)||uri.equals(ctx+"/")){
			chain.doFilter(request,response);
			return;
		}
		User user = (User)hrequest.getSession().getAttribute("me");//user导入的tomcat的
		if(user == null){
			System.out.println("成功拦截到非法用户企图入侵网站后台："+uri);
			wrapper.sendRedirect(redirectPath);
			return;
		}
		chain.doFilter(request,response);
	}
	@Override
	public void init(FilterConfig config)throws ServletException{
		this.config = config;
	}
}
