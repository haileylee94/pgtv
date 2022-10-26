package com.gtv.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gtv.service.MovieComService;
import com.gtv.vo.ComVO;


@Controller
@RequestMapping("/*")
public class MovieComController2 {
	
	@Autowired
	private MovieComService moviecomService;
	
	//��ȭ���
		@GetMapping("/register")
		public void register() {
			
		}
	
	//��ȭ����Ʈ
	@GetMapping("/movie")
	public ModelAndView movie(HttpServletRequest request) {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("movie/movie");
		return m;
	}
	
	//��ȭ ������ �ڸ�Ʈ ����
	@GetMapping("/com_write")
	public ModelAndView com_write(HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("movie/com_write");//�丮���� ��� ����. �� �������� ��δ� 
		// /WEB-INF/views/movie/com_write.jsp
		mv.addObject("page", page);
		return mv;
	}//com_write()
	
	//�ڸ�Ʈ ����
	@PostMapping("/com_write_ok")
	public String com_write_ok(ComVO c,RedirectAttributes rttr) throws Exception{
		
		moviecomService.insertCom(c);
		rttr.addFlashAttribute("msg", "SUCCESS");
		//rttr.addFlashAttribute�� ������ ���� url�ڿ� ���� �ʴ´�. ��ȸ���̶� ���������� ��� �����Ͱ� �Ҹ��Ѵ�.
		//���� 2���̻� �� ���, �����ʹ� �Ҹ��Ѵ�. ���� ���� �̿��Ͽ� �ѹ��� �������ؾ��Ѵ�.
		return "redirect:/com_list";
		
	}
	

}
