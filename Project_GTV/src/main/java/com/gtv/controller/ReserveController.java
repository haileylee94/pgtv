package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.ReserveService;
import com.gtv.vo.MovietotalVO;
import com.gtv.vo.ReservationVO;
import com.gtv.vo.Seat_theaterVO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping("/reserve")
	public ModelAndView reserve(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		int movieTotalSel = Integer.parseInt(request.getParameter("movieTotalSel"));
		MovietotalVO mtvo = new MovietotalVO();
		mtvo.setMovietotalnum(movieTotalSel);
		
		MovietotalVO movietotal = reserveService.getMovie(mtvo);
		
		List<Seat_theaterVO> stv = reserveService.getSeat(mtvo);
		
		
		
		mav.addObject("seat", stv);
		mav.addObject("movietotal", movietotal);
		mav.setViewName("reserve/reserve");
		return mav;
	}
	
	@PostMapping(value = "result")
	public String seatSelect(HttpServletRequest request,Seat_theaterVO seatVO) throws Exception {

		int movietotalnum = Integer.parseInt(request.getParameter("movieTotalSel"));
		String[] seat_names = seatVO.getSeat_name().split(",");
		int adult = Integer.parseInt(request.getParameter("adultCount")) ;
		int kid = Integer.parseInt(request.getParameter("kidCount"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		ReservationVO rvo1 = new ReservationVO();
		for (int i = 0; i < seat_names.length; i++) {
			rvo1.setMovietotalnum(movietotalnum);
			rvo1.setSeat(seat_names[i]);
			reserveService.insertbook(rvo1);
		}
		
		ReservationVO rvo2 = new ReservationVO();
		rvo2.setMovietotalnum(movietotalnum);
		rvo2.setAdult(adult);
		rvo2.setTeen(kid);
		rvo2.setPayment(price);
		rvo2.setSeat(seatVO.getSeat_name());
		reserveService.insertbooking(rvo2);
		
		
		MovietotalVO mav =  new MovietotalVO ();
		mav.setMovietotalnum(movietotalnum);
		
		
		
		
		

		return "reserve/result";
	}
	
	
	
	
	
	
	
}
