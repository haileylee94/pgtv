package com.gtv.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public void insertAuth(String id) {
		this.sqlSession.insert("mem_auth", id);
	}

	@Override
	public MemberVO loginCheck(String input_id) {
		return this.sqlSession.selectOne("login_ck", input_id);
	}

	@Override
	public MemberVO find_id(MemberVO m) {
		
		return this.sqlSession.selectOne("Ser_id", m);
	}
	
	@Override
	public MemberVO find_pwd(MemberVO m) {
		return this.sqlSession.selectOne("Ser_pwd", m);
	}

	@Override
	public void updatePwd(MemberVO m) {
	    this.sqlSession.update("pw_edit", m);
		
	}

	@Override
	public MemberVO view_info(String id) {
		return this.sqlSession.selectOne("vw_info", id);
	}

	@Override
	public void edit_info(MemberVO vo) {
		this.sqlSession.update("edit_info", vo);
		
	}

}
