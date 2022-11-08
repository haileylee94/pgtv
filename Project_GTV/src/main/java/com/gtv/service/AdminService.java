package com.gtv.service;

import java.util.List;

import com.gtv.vo.MemberVO;

public interface AdminService {

	int getRowCount();

	List<MemberVO> getBoardList(MemberVO mem);

	int deleteMember(int num);

}
