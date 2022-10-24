package com.gtv.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.MovieComService;
import com.gtv.vo.MovieComVO;

@Controller
@RequestMapping("/*")
public class MovieComController {
	
	@Autowired
	private MovieComService moviecomService;
	
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
//	@PostMapping("/com_write_ok")
//	public String com_write_ok(MovieComVO mc,HttpServletRequest request) throws Exception{
//		mc.setCont_com(cont_com);
//		
//		moviecomService.insertCom(mc);
//		return "redirect:/com_list";
//		
//	}
	

}
