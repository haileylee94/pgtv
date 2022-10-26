package com.gtv.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// ������ �ٽ� �ۼ��ؾ���.
		System.out.println("�α��� ����");
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		}); // �α��� �� ����ڿ��� �ο��� ������ ���ؼ� ���ڿ��� üũ�� ���� �÷��ǿ� �߰�
		
		System.out.println("ROLE NAMES : " + roleNames); // ����� ������ ���
		
		if(roleNames.contains("ADMIN")) { // ������ �����϶�
			response.sendRedirect("/sample/admin");
			return;
		}
		
		if(roleNames.contains("MEMBER")) { // �Ϲ� ȸ���϶�
			response.sendRedirect("/sample/member");
			return;
		}
		
		response.sendRedirect("/");

	}

}
