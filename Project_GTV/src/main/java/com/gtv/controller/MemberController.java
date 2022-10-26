package com.gtv.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.MemberService;
import com.gtv.vo.MemberVO;

import pwdconv.PwdChange;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인
	@RequestMapping("login")
	public ModelAndView login() {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("login");
		return m;
	}
	
	//회원가입 페이지
	@RequestMapping("sign_up")
	public String sign_up(Model m) {

		return "/sign_up";
    }
	
	@RequestMapping("cus_info")
	public String cus_info() {
		
		return "/cus_info";
	}
		
		
	
	
	//회원가입 유저 저장
	@RequestMapping("sign_up_ok")
	public String sign_up_ok(MemberVO m) {
		
		m.setUser_pw(PwdChange.getPassWordToXEMD5String(m.getUser_pw()));
		this.memberService.insertMember(m);
		return "redirect:/sign_up";
	}
	
	//로그인 인증
	@RequestMapping("login_ok")
	public String login_ok(String user_id, String user_pw, HttpSession session, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberVO dm = this.memberService.loginCheck(user_id); //가입회원 1이고, 아이디가 맞으면 로그인 인증. 탈퇴 회원 2는 로그인 인증 못함
		
		if(dm == null) {
			out.println("<script>");
			out.println("alert('가입 안된 회원입니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			if(!dm.getUser_pw().contentEquals(PwdChange.getPassWordToXEMD5String(user_pw))) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("id", user_id); //세션 아이디에 아이디 저장
				return "redirect:/cus_info"; //메인으로 이동
			}
		}
		return null;
	}
	
//	@RequestMapping(value = "my_info")
//	@ResponseBody
//	public String info_edit() {
//		
//		this.memberService.sel_info();
//		return null;
//		
//	}
	
	@RequestMapping("SerPwd_in")
	public ModelAndView SerPwd_in() {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("SerPwd_in");
		return m;
	}
	
	@RequestMapping("SerId_in")
	public ModelAndView SerId_in() {
		ModelAndView m = new ModelAndView();
		m.setViewName("SerId_in");
		return m;
	}
	
	@RequestMapping(value = "/SerId_in_ok", method = {RequestMethod.POST,RequestMethod.GET}, consumes = "application/json;")
	public String SerId_in_ok(HttpServletResponse response, @RequestBody MemberVO m) throws Exception{
		System.out.println(m.getUser_name());
		System.out.println(m.getUser_birth1());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		MemberVO pm = this.memberService.find_id(m);
		
		if(pm == null) {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다!\\n 올바른 아이디와 이름을 입력하세요!);");
			out.println("history.back();");
			out.println("</script>");
		}else {
			return null;
		}
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
