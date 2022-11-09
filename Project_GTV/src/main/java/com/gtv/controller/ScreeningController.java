package com.gtv.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.ScreeningService;
import com.gtv.vo.DateVO;
import com.gtv.vo.MovieVO;
import com.gtv.vo.MovietotalVO;
import com.gtv.vo.RegiondetailVO;

@Controller
@RequestMapping("/*")
public class ScreeningController {

	@Autowired
	private ScreeningService screeningService;

	@RequestMapping("/screening")
	public ModelAndView screening(Model li, MovieVO mv, RegiondetailVO rv, MovietotalVO mvo, Authentication auth) throws Exception {
		
		

		
		String id = auth.getName();
		
		ModelAndView m = new ModelAndView();
		List<MovieVO> mlist = screeningService.getList(mv);
		List<RegiondetailVO> rlist = screeningService.getBranch(rv);
		List<RegiondetailVO> region = screeningService.getRegion(rv);
		
		System.out.println(id);
		String date = LocalDate.now().toString();
		String[] nowdate = date.split("-");
		int year = Integer.parseInt(nowdate[0]);
		int month = Integer.parseInt(nowdate[1]);
		int day = Integer.parseInt(nowdate[2]);
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month, day);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		List<DateVO> dayWeekList = new ArrayList<DateVO>();
		String strMonth = "";
		
		int cnt = 0;
		for (int i = 0; i < 15; i++) {

			DateVO dvo = new DateVO();

			if ((day + i - 2) >= lastDay) {
				cnt++;
				int nextMonthDay = 0;

				if(month == 12) {
					year++;
					month = 0;
				}
				
				dvo.setYear(Integer.toString(year));
				
				if((month + 1)<10) {
					strMonth = "0" + Integer.toString(month + 1);
				}else {
					strMonth = Integer.toString(month+1);
				}
				
				dvo.setMonth(strMonth);
				dvo.setDay(Integer.toString(nextMonthDay + cnt));
				
				
				LocalDate date2 = LocalDate.of(year, month + 1, nextMonthDay + cnt);
				DayOfWeek dayOfWeek = date2.getDayOfWeek();
				dvo.setDayOfweek(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0, 1));			
				
				dayWeekList.add(dvo);
				
				continue;
			}

			dvo.setYear(Integer.toString(year));
			
			if((month)<10) {
				strMonth = "0" + Integer.toString(month);
			}else {
				strMonth = Integer.toString(month);
			}
			
			dvo.setMonth(strMonth);
			dvo.setDay(Integer.toString(day + i));

			LocalDate date2 = LocalDate.of(year, month, day + i);
			DayOfWeek dayOfWeek = date2.getDayOfWeek();
			dvo.setDayOfweek(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN).substring(0, 1));			
			
			dayWeekList.add(dvo);
		}
		
		m.addObject("id", id);
		m.addObject("dayWeekList", dayWeekList);
		m.addObject("mlist", mlist);
		m.addObject("rlist", rlist);
		m.addObject("region", region);
		m.setViewName("reserve/screening");
		return m;
	}
	

	
	@RequestMapping(value = "/movieData")
	public ModelAndView regionDetailList(HttpServletRequest request) throws Exception {

		int movienum = Integer.parseInt(request.getParameter("movienum"));

		ModelAndView mav = new ModelAndView();
		MovieVO movieData = screeningService.getMovieData(movienum);

		mav.addObject("movieData", movieData);
		
		mav.setViewName("jsonView");

		return mav;
	}
	
	
	@RequestMapping(value = "/regionDetailList")
	public ModelAndView movieData(HttpServletRequest request) throws Exception {

		int theaternum = Integer.parseInt(request.getParameter("theaternum"));
		ModelAndView mav = new ModelAndView();
		RegiondetailVO regvo = screeningService.getRegiondetail(theaternum);
		
		mav.addObject("regvo", regvo);
		mav.setViewName("jsonView");

		return mav;
	}
	
	
	@RequestMapping(value = "/movieTotalData")
	public String movieTotalData(HttpServletRequest request,Model model) throws Exception {
		
		String movieSel = request.getParameter("movieSel");
		String regionSel = request.getParameter("regionSel");
		String dateSel = request.getParameter("dateSel");
		
		List<MovietotalVO> mtlist = getMtlist(movieSel,regionSel,dateSel);

		model.addAttribute("mtlist", mtlist);

		return "reserve/movieschedule";
	}



	public List<MovietotalVO> getMtlist(String movieSel, String regionSel, String dateSel) throws Exception {
		
		int nmovieSel=0;
		if(movieSel !=null) {
			nmovieSel = Integer.parseInt(movieSel);
		}
		
		int nregionSel = 0 ;
		if(regionSel != null) {
			nregionSel = Integer.parseInt(regionSel);
		}
		
		if(dateSel == null) {
			dateSel = "";
		}
		
		
		MovietotalVO mtvo = new MovietotalVO();
		mtvo.setMovienum(nmovieSel);
		mtvo.setTheaternum(nregionSel);
		mtvo.setStrdate(dateSel);
		
		
		
		List<MovietotalVO> movietotallist = screeningService.getMovieTotalList(mtvo);
		
		
		
		return movietotallist;
	}
	
	@RequestMapping(value = "/movieSelect")
	public String movieSelect(HttpServletRequest request,Model model) throws Exception {
		
		String movieTotalSel = request.getParameter("movieTotalSel");
		int movieTotalSeln = 0;
		movieTotalSeln = Integer.parseInt(movieTotalSel);
		
		MovietotalVO mtvo = new MovietotalVO();
		mtvo.setMovietotalnum(movieTotalSeln);
		
		MovietotalVO movieselect = screeningService.movieselect(mtvo);
		
		model.addAttribute("movieselect", movieselect);
		
		
		return "reserve/movieselect";
	}


	
	
	
	
	
	
	
	
	
	
}
