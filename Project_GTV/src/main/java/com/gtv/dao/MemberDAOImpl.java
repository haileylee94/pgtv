package com.gtv.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gtv.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO m) {
		this.sqlSession.insert("m_in",m);
		
	}

	@Override
	public MemberVO loginCheck(String input_id) {
		
		return this.sqlSession.selectOne("login_ck", input_id);
	}

	@Override
	public MemberVO find_id(MemberVO m) {
		
		return this.sqlSession.selectOne("Ser_id", m);
	}
}
