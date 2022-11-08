package com.gtv.vo;


import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_gender;
	private String user_phone1;
	private String user_phone2;
	private String user_phone3;
	private String user_birth1;
	private String user_birth2;
	private String user_birth3;

	private String email;
	private String email_domain;
	private String user_date;
	private int user_state;
	private String del_cont;
	private String del_date;
	

	// 권한정보
	private List<AuthVO> auth;
	
	// 어드민 페이징 변수
	private int startrow;
	private int endrow;

}