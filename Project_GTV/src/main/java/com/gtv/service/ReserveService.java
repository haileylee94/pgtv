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

   ReservationVO getnum(ReservationVO rvo2);

   void updateremain(ReservationVO rvo3);

   ReservationVO gettotalnum(int reservenum);

   void deleteSeat(ReservationVO re);

   void deleteReserve(int reservenum);

   List<ReservationVO> getmvList(String id);





   

}