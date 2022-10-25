package com.gtv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import com.gtv.vo.MovieVO;
import com.gtv.vo.RegiondetailVO;
import com.gtv.vo.ScreeningVO;

@Repository
public class ScreeningDAOImpl implements ScreeningDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MovieVO> getList(MovieVO mv) {
		return sqlSession.selectList("mlist", mv);
	}

	@Override
	public List<RegiondetailVO> getBranch(RegiondetailVO rv) {
		return sqlSession.selectList("rlist", rv);
	}
	

}
