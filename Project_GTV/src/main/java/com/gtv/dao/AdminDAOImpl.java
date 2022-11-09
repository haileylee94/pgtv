package com.gtv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gtv.vo.MemberVO;
import com.gtv.vo.MovietotalVO;

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

	@Override
	public int deleteMember(int num) {
		return this.sqlSession.update("adm_del_mem", num);
	}

	@Override
	public int getMovRowCount() {
		return this.sqlSession.selectOne("adm_mov_count");
	}

	@Override
	public List<MovietotalVO> getMovieList(MovietotalVO mov) {
		return this.sqlSession.selectList("adm_mov_list", mov);
	}

	@Override
	public int deleteMovie(int num) {
		return this.sqlSession.delete("adm_mov_del", num);
	}
	
	
}
