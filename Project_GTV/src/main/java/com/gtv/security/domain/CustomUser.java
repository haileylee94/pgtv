package com.gtv.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.gtv.vo.MemberVO;

public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	public CustomUser(MemberVO vo) {
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuth() );
	} // ������ �����ε�
	
	
	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

}
