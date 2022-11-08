package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
	public ModelAndView reserve(HttpServletRequest request,Authentication auth) {
		ModelAndView mav = new ModelAndView();
		String id = auth.getName();
		
		int movieTotalSel = Integer.parseInt(request.getParameter("movieTotalSel"));
		MovietotalVO mtvo = new MovietotalVO();
		mtvo.setMovietotalnum(movieTotalSel);
		
		MovietotalVO movietotal = reserveService.getMovie(mtvo);
		
		List<Seat_theaterVO> stv = reserveService.getSeat(mtvo);
		
		
		mav.addObject("id", id);
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
		String id = request.getParameter("idSel");
		int total = Integer.parseInt(request.getParameter("count"));
		
	
		
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
		rvo2.setUser_id(id);
		rvo2.setTotal(total);
		reserveService.insertbooking(rvo2);
		
		//reservation num 가져오기
		
		MovietotalVO mav =  new MovietotalVO();
		mav.setMovietotalnum(movietotalnum);
		
		
		
		reserveService.updateremain(mav);
		

		return "reserve/result";
	}
	
	
	
	
	
	
	
}
