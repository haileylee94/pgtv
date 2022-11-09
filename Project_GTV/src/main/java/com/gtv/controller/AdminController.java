package com.gtv.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.AdminService;
import com.gtv.vo.MemberVO;
import com.gtv.vo.MovietotalVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 어드민 메인페이지
	@RequestMapping("/main")
	public ModelAndView main() {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("admin/admin_main");
		return m;
	}
	
	// 어드민 유저관리페이지
	@RequestMapping("/member")
	public String member(Model m, MemberVO mem, HttpServletRequest request) {
		
		int page = 1;
		int limit = 10; // 한 페이지에서 보여지는 목록 개수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		mem.setStartrow((page-1)*10 + 1); // 시작 행 번호
		mem.setEndrow(mem.getStartrow() + limit - 1); // 끝행 번호
		// 결국 한 페이지에서 검색되는 목록 개수가 5개로 제한된다.
		
		int totalCount = this.adminService.getRowCount(); //총 유저 레코드 개수
		List<MemberVO> memlist = this.adminService.getBoardList(mem); // 게시판 목록
		
		// 페이징 즉 쪽나누기 관련 연산
		int maxpage = (int)((double)totalCount/limit + 0.95); // 총 페이지 수
		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; // 시작 페이지
		int endpage = maxpage; // 현재 페이지에 보여질 마지막 페이지
		
		if(endpage > startpage + 10 - 1) endpage = startpage + 10 - 1;
		
		m.addAttribute("list", memlist); // list키 이름에 목록 저장
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		
		return "admin/admin_member";
	}
	
	/*
	// 어드민 영화관리페이지 (시큐리티에 저장된 정보 출력 시험용)
	@RequestMapping("/movie")
	public ModelAndView movie(Authentication auth) {
		
		String name = auth.getName();
		System.out.println(auth.getName());
		
		ModelAndView m = new ModelAndView();
		m.addObject("id", name);
		m.setViewName("admin/admin_movie");
		return m;
	} */
	
	// 어드민 영화관리페이지 (실제 출력용)
	@RequestMapping("/movie")
	public String movie(Model m, MovietotalVO mov, HttpServletRequest request) {
		
		int page = 1;
		int limit = 3; // 한 페이지에서 보여지는 목록 개수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		mov.setStartrow((page-1)*3 + 1); // 시작 행 번호
		mov.setEndrow(mov.getStartrow() + limit - 1); // 끝행 번호
		// 결국 한 페이지에서 검색되는 목록 개수가 3개로 제한된다.
		
		int totalCount = this.adminService.getMovRowCount(); //총 영화 레코드 개수
		List<MovietotalVO> movlist = this.adminService.getMovieList(mov); // 영화 목록
		
		// 페이징 즉 쪽나누기 관련 연산
		int maxpage = (int)((double)totalCount/limit + 0.95); // 총 페이지 수
		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; // 시작 페이지
		int endpage = maxpage; // 현재 페이지에 보여질 마지막 페이지
		
		if(endpage > startpage + 10 - 1) endpage = startpage + 10 - 1;
		
		m.addAttribute("list", movlist); // list키 이름에 목록 저장
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		
		return "admin/admin_movie";
	}
	
	// 유저 삭제 (비활성화)
	@RequestMapping("delete_ok")
	public void deleteok(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int num = Integer.parseInt(request.getParameter("user_no"));
		
		int info = this.adminService.deleteMember(num);
		
		if(info == 1) {
			out.println("<script>");
			out.println("alert('삭제하였습니다.');");
			out.println("location='/admin/member';");
			out.println("</script>");
		}
	}
	
	// 영화 삭제
	@RequestMapping("mov_delete_ok")
	public void mov_delete_ok(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int num = Integer.parseInt(request.getParameter("movietotalnum"));
		
		int info = this.adminService.deleteMovie(num);
		
		if(info == 1) {
			out.println("<script>");
			out.println("alert('삭제하였습니다.');");
			out.println("location='/admin/movie';");
			out.println("</script>");
		}
	}
	
	// 영화 추가
	@RequestMapping("movie_add")
	public String movieAdd() {
		return "admin/admin_mov_add";
	}
	
}
