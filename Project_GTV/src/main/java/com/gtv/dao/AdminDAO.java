package com.gtv.dao;

import java.util.List;

import com.gtv.vo.MemberVO;

public interface AdminDAO {

	int getRowCount();

	List<MemberVO> getBoardList(MemberVO mem);

	int deleteMember(int num);

}
