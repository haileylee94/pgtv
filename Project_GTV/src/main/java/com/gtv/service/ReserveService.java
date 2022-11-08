package com.gtv.service;

import java.util.List;

import com.gtv.vo.MovietotalVO;
import com.gtv.vo.ReservationVO;
import com.gtv.vo.Seat_theaterVO;

public interface ReserveService {

	MovietotalVO getMovie(MovietotalVO mtvo);

	List<Seat_theaterVO> getSeat(MovietotalVO mtvo);

	void insertbook(ReservationVO rvo);

	void insertbooking(ReservationVO rvo2);

	



	

}
