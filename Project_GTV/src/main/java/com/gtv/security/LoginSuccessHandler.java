package com.gtv.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("로그인 성공");
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		}); // 로그인 한 사용자에게 부여한 권할을 구해서 문자열로 체크한 다음 컬렉션에 추가 
		
		System.out.println("ROLE NAMES : " + roleNames); // 사용자 권한을 출력
		
		if(roleNames.contains("ROLE_ADMIN")) { // 관리자 권한일때
			response.sendRedirect("/");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) { // 일반 회원일때
			response.sendRedirect("/");
			return;
		}

	}

}
