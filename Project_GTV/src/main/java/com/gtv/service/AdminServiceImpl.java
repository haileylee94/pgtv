package com.gtv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.AdminDAO;
import com.gtv.vo.MemberVO;
import com.gtv.vo.MovietotalVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	@Override
	public int getRowCount() {
		return this.adminDao.getRowCount();
	}

	@Override
	public List<MemberVO> getBoardList(MemberVO mem) {
		return this.adminDao.getBoardList(mem);
	}

	@Override
	public int deleteMember(int num) {
		return this.adminDao.deleteMember(num);
	}

	@Override
	public int getMovRowCount() {
		return this.adminDao.getMovRowCount();
	}

	@Override
	public List<MovietotalVO> getMovieList(MovietotalVO mov) {
		return this.adminDao.getMovieList(mov);
	}

	@Override
	public int deleteMovie(int num) {
		return this.adminDao.deleteMovie(num);
	}
	
	
}
