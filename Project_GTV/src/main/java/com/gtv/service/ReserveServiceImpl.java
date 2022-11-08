package com.gtv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.ReserveDAO;
import com.gtv.vo.MovietotalVO;
import com.gtv.vo.ReservationVO;
import com.gtv.vo.SeatNumberVO;
import com.gtv.vo.Seat_theaterVO;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Autowired
	private ReserveDAO reserveDao;

	@Override
	public MovietotalVO getMovie(MovietotalVO mtvo) {
		return reserveDao.getMovie(mtvo);
	}

	@Override
	public List<Seat_theaterVO> getSeat(MovietotalVO mtvo) {
		return reserveDao.getSeat(mtvo);
	}

	@Override
	public void insertbook(ReservationVO rvo) {
		reserveDao.insertbook(rvo);
		
	}

	@Override
	public void insertbooking(ReservationVO rvo2) {
		reserveDao.insertbooking(rvo2);
		
	}

	

	


}
