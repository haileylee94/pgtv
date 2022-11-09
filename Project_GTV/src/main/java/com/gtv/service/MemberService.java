package com.gtv.service;

import com.gtv.vo.MemberVO;


public interface MemberService {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String input_id);

	MemberVO find_id(MemberVO m);

	MemberVO find_pwd(MemberVO m);

	void updatePwd(MemberVO m);

	MemberVO view_info(String id);

	void edit_info(MemberVO vo);

}
