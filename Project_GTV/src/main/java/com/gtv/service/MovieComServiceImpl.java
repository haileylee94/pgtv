package com.gtv.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.MovieComDAO;

import com.gtv.vo.ComVO;


@Service
public class MovieComServiceImpl implements MovieComService {

	@Autowired
	private MovieComDAO moviecomDao;


	@Override
	public void insertCom(ComVO c) {
		moviecomDao.insertCom(c);
	}

	@Override
	public int getRowCount() {
		return moviecomDao.getRowCount();
	}

	@Override
	public List<ComVO> getComList(ComVO c) {
		return moviecomDao.getComList(c);
	}

	@Override
	public ComVO getCont(int com_num) {
		return moviecomDao.getCont(com_num);
	}

	@Override
	public void editCom(ComVO ec) {
		moviecomDao.editCom(ec);
	}

	@Override
	public void delCom(int com_num) {
		moviecomDao.delCom(com_num);
	}

	
}
