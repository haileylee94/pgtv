package com.gtv.service;

import com.gtv.vo.MemberVO;


public interface MemberService {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String input_id);

	MemberVO find_id(MemberVO m);

}
