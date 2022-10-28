package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gtv.service.MovieComService;
import com.gtv.vo.ComVO;
import com.gtv.vo.MovieVO;


@Controller
@RequestMapping("/*")
public class MovieComController {
	
	@Autowired
	private MovieComService moviecomService;
	
	//��ȭ����Ʈ
	@GetMapping("/movie")
	public ModelAndView movie(HttpServletRequest request) {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("movie/movie");
		return m;
	}
	
	//��ȭ ������ �ڸ�Ʈ ����
	@GetMapping("/com_write")
	public ModelAndView com_write(HttpServletRequest request, MovieVO movieVo) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		ModelAndView mv = new ModelAndView();
		movieVo.setMovienum(1);
		movieVo.setMoviename("����2");
		mv.setViewName("movie/com_write");//�丮���� ��� ����. �� �������� ��δ� 
		// /WEB-INF/views/movie/com_write.jsp
		mv.addObject("page", page);
		return mv;
	}//com_write()
	
	//�ڸ�Ʈ ����
	@PostMapping("/com_write_ok")
	public String com_write_ok(ComVO c,RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		
		String movienum=request.getParameter("movienum");
		String moviename=request.getParameter("moviename");
		System.out.println("��ȭ ��ȣ: "+movienum + "��ȭ �̸�: "+moviename);
		moviecomService.insertCom(c);
		rttr.addFlashAttribute("msg", "SUCCESS");
		//rttr.addFlashAttribute�� ������ ���� url�ڿ� ���� �ʴ´�. ��ȸ���̶� ���������� ��� �����Ͱ� �Ҹ��Ѵ�.
		//���� 2���̻� �� ���, �����ʹ� �Ҹ��Ѵ�. ���� ���� �̿��Ͽ� �ѹ��� �������ؾ��Ѵ�.
		return "redirect:/com_list";
		
	}
	
	//�ڸ�Ʈ ����Ʈ
	@GetMapping("com_list")
	public String com_list(Model m,HttpServletRequest request,ComVO c) {
		int page=1;
		int limit=5; //���������� �������� ��ϰ���
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		c.setStartrow((page-1)*5+1);
		c.setEndrow(c.getStartrow()+limit-1);
		
		int totalCount=this.moviecomService.getRowCount();//�� �ڸ�Ʈ ����
		List<ComVO> clist=this.moviecomService.getComList(c); //�ڸ�Ʈ ���
		
		/*����¡ ���� ����*/
		int maxpage=(int)((double)totalCount/limit+0.95);//�� ������ ��
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;//����������
		int endpage=maxpage;//������������ ������ ������ ������
		
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		m.addAttribute("list", clist);//list Ű �̸��� ��� ����
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		
		return "movie/com_list";
			
	}
	

}
