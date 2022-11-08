package com.gtv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.AdminDAO;
import com.gtv.vo.MemberVO;

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
	
	
}
