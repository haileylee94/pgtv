package com.gtv.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 濡쒓렇�씤�솗�씤
	/*@RequestMapping(value = "login_ok", method = RequestMethod.POST)
	public String login_ok(String user_id, String user_pw, HttpSession session, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberVO dm = this.memberService.loginCheck(user_id); //DB�뿉�꽌 �븘�씠�뵒媛믪쓣 媛��졇�샂
		
		if(dm == null) {
			out.println("<script>");
			out.println("alert('�븘�씠�뵒媛� ��由쎈땲�떎');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!pwdEncoder.matches(dm.getUser_pw(), user_pw)) {
				out.println("<script>");
				out.println("alert('鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎.');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("id", user_id); //
				return "redirect:/user/cus_info"; //
			}
		}
		return null;
	} */
	
	/*@RequestMapping(value = "info_edit")
	public MemberVO info_edit() {
		MemberVO vo = this.memberService.view_info();
		
		return null;
	}*/
		
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
			out.println("alert('占쎌돳占쎌뜚占쎌젟癰귣�占쏙옙 筌≪뼚�뱽 占쎈땾 占쎈씨占쎈뮸占쎈빍占쎈뼄!\\n 占쎌궞獄쏅뗀�뀲 占쎈툡占쎌뵠占쎈탵占쏙옙 占쎌뵠�뵳袁⑹뱽 占쎌뿯占쎌젾占쎈릭占쎄쉭占쎌뒄!);");
			out.println("history.back();");
			out.println("</script>");
		}else {
			Random r = new Random();
			int pwd_random = r.nextInt(10000);
			String ran_pwd = Integer.toString(pwd_random);
			sendEmail(pm,ran_pwd);
			
			//占쎌뵠筌롫뗄�뵬嚥∽옙 占쎈릊占쎌깈占쎌넅 占쎈툧占쎈쭆 占쎈릊占쎌깈�몴占� �솒�눘占� 占쎌뵠筌롫뗄�뵬嚥∽옙 癰귣�沅→�⑨옙, 域뱄옙 占쎌뜎 占쎈릊占쎌깈占쎌넅�몴占� 占쎈릭�⑨옙 vo揶쏅�る퓠 占쎈뼖占쎈툡 db占쏙옙占쎌삢.
			m.setUser_pw(ran_pwd);
			
			this.memberService.updatePwd(m); //�뜮袁⑥쓰占쎈땾占쎌젟
			
			ModelAndView view = new ModelAndView();
			view.setViewName("/");
			return view;
		}
		
		
		
		return null;
	}
	
	public void sendEmail(MemberVO pm, String ran_pw) throws Exception {
		
		String subject = "test 筌롫뗄�뵬";
		String content = "�⑥쥒而쇽옙�뻷占쎌벥 占쎌뿫占쎈뻻�뜮袁⑨옙甕곕뜇�깈占쎈뮉" + ran_pw +"占쎌뿯占쎈빍占쎈뼄.";
		String from = "tmd020419@gmail.com";
		String to = pm.getEmail()+"@"+pm.getEmail_domain(); //占쎈연疫꿸퀣苑� 占쎈염占쎄묶占쎌굨占쎈립占쎈�� 占쎈솁占쎌뵬癰귣�源됵옙�벉
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
