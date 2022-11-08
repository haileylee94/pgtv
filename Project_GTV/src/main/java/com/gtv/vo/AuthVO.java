package com.gtv.vo;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class AuthVO implements GrantedAuthority {

	private String user_id;
	private String authority;
	
	@Override
	public String getAuthority() {
		return authority;
	}

}
