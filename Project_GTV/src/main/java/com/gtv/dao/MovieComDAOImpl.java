package com.gtv.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieComDAOImpl implements MovieComDAO {

	@Autowired
	private SqlSession sqlSession;
}
