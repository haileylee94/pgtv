package com.gtv.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	private String user_date;
	private int user_state;
	private String del_cont;
	private String del_date;
	
	// 여기에 멤버 권한 추가
	private List<AuthVO> auth;
}