package com.gtv.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;

public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		System.out.println("AccessDeniedHandler작동");
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert=('로그인이 필요한 서비스입니다.');");
		out.print("</script>");
		
		response.sendRedirect("/login");

	}

}
