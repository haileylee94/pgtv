package com.gtv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gtv.vo.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getRowCount() {
		return this.sqlSession.selectOne("adm_mem_count");
	}

	@Override
	public List<MemberVO> getBoardList(MemberVO mem) {
		return this.sqlSession.selectList("adm_mem_list", mem);
	}
	
	
}
