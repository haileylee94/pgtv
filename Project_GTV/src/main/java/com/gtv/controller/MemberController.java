package com.gtv.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.MemberService;
import com.gtv.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	public JavaMailSender mailSender;
	
	//
	@RequestMapping("/customlogin")
	public ModelAndView login() {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/user/customlogin");
		return m;
	}
	
	//
	@RequestMapping("sign_up")
	public String sign_up(Model m) {

		return "/user/sign_up";
    }
	
	@RequestMapping("cus_info")
	public String cus_info() {
		
		return "/user/cus_info";
	}	
	
	// 회원가입
	@RequestMapping(value = "sign_up_ok", method = RequestMethod.POST)
	public String sign_up_ok(MemberVO m) throws Exception{
		
		String pwd = pwdEncoder.encode(m.getUser_pw());				
		m.setUser_pw(pwd);
		this.memberService.insertMember(m);
		return "redirect:/customlogin";
	}
	
	// 로그인확인
	/*@RequestMapping(value = "login_ok", method = RequestMethod.POST)
	public String login_ok(String user_id, String user_pw, HttpSession session, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberVO dm = this.memberService.loginCheck(user_id); //DB에서 아이디값을 가져옴
		
		if(dm == null) {
			out.println("<script>");
			out.println("alert('아이디가 틀립니다');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!pwdEncoder.matches(dm.getUser_pw(), user_pw)) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("id", user_id); //
				return "redirect:/user/cus_info"; //
			}
		}
		return null;
	} */
	
	@RequestMapping("info_edit")
	public ModelAndView info_edit(HttpServletResponse response,Authentication auth,HttpSession session) {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = auth.getName();
		
		MemberVO vo = this.memberService.view_info(id);
		
		ModelAndView view = new ModelAndView();
		
		String gender = "";
		if(vo.getUser_gender() == 1) {
			gender = "남자";
		}else {
			gender = "여자";
		}
		
		view.addObject("user_name", vo.getUser_name());
		view.addObject("user_id", vo.getUser_id());
		view.addObject("user_gender", gender);
		view.addObject("user_birth1", vo.getUser_birth1());
		view.addObject("user_birth2", vo.getUser_birth2());
		view.addObject("user_birth3", vo.getUser_birth3());
		view.addObject("user_phone1", vo.getUser_phone1());
		view.addObject("user_phone2", vo.getUser_phone2());
		view.addObject("user_phone3", vo.getUser_phone3());
		view.addObject("email", vo.getEmail());
		view.addObject("email_domain", vo.getEmail_domain());
		view.setViewName("/user/info_edit");
		
		
		
		return view;
	}
	
	@RequestMapping(value = "/info_edit_ok", method = RequestMethod.POST)
	public ModelAndView info_edit_ok(MemberVO vo, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(vo.getUser_name());
		this.memberService.edit_info(vo);
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/cus_info");
		return view;
	}
	
	@RequestMapping("payment_history")
	public ModelAndView payment_history() {
		
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/user/payment_history");
		
		return view;
	}
		
	@RequestMapping("SerPwd_in")
	public ModelAndView SerPwd_in() {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/user/SerPwd_in");
		return m;
	}
	
	@RequestMapping("SerId_in")
	public ModelAndView SerId_in() {
		ModelAndView m = new ModelAndView();
		m.setViewName("/user/SerId_in");
		return m;
	}
	
	@ResponseBody
	@RequestMapping(value = "/SerId_in_ok", method = {RequestMethod.POST,RequestMethod.GET}, consumes = "application/json" )
	public String SerId_in_ok(HttpServletResponse response ,@RequestBody MemberVO m) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
	
		MemberVO param = this.memberService.find_id(m);
		
	    String id = param.getUser_id();
		
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value = "/SerPwd_in_ok",method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView SerPwd_in_ok(HttpServletRequest request, HttpServletResponse response, @RequestBody MemberVO m) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		MemberVO pm = this.memberService.find_pwd(m);
		
		if(pm == null) {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다!\\n 올바른 아이디와 이름을 입력하세요!);");
			out.println("history.back();");
			out.println("</script>");
		}else {
			Random r = new Random();
			int pwd_random = r.nextInt(10000);
			String ran_pwd = Integer.toString(pwd_random);
			sendEmail(pm,ran_pwd);
			
			
		
			m.setUser_pw(ran_pwd);
			
			this.memberService.updatePwd(m); //암호화된 비밀번호 DB저장
			
			ModelAndView view = new ModelAndView();
			view.setViewName("/");
			return view;
		}
		
		
		
		return null;
	}
	
	public void sendEmail(MemberVO pm, String ran_pw) throws Exception {
		
		String subject = "test 메일";
		String content = "고객님의 임시비밀번호는" + ran_pw +"입니다.";
		String from = "tmd020419@gmail.com";
		String to = pm.getEmail()+"@"+pm.getEmail_domain(); 
		try {
			MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content,true);
            
            mailSender.send(mail);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
