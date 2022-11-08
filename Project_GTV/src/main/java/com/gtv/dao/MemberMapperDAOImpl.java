package com.gtv.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gtv.vo.MemberVO;

@Repository
public class MemberMapperDAOImpl implements MemberMapperDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO readMember(String id) {
		return this.sqlSession.selectOne("read_meminfo", id);
	}

}
