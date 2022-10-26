package com.gtv.dao;

import com.gtv.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String input_id);

	MemberVO find_id(MemberVO m);

}
