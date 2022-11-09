package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
   
   //영화리스트
   @GetMapping("/movie")
   public ModelAndView movie(HttpServletRequest request) {
      
      ModelAndView m = new ModelAndView();
      m.setViewName("movie/movie");
      return m;
   }
   
   
//   //영화 상세정보
//   @GetMapping("/movie_sub")
//   public ModelAndView movie_sub(HttpServletRequest request) {
//      
//      ModelAndView m = new ModelAndView();
//      m.setViewName("movie/movie_sub");
//      return m;
//   }
   
   //영화 상세 정보 + 관람객 코멘트 쓰기
   @GetMapping("/movie_sub")
   public ModelAndView com_write(HttpServletRequest request, MovieVO movieVo) {
      int page=1;
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      ModelAndView mv = new ModelAndView();
      movieVo.setMovienum(1);
      movieVo.setMoviename("공조2");
      mv.setViewName("movie/movie_sub");//뷰리졸브 경로 설정. 즉 뷰페이지 경로는 
      // /WEB-INF/views/movie/com_write.jsp
      mv.addObject("page", page);
      return mv;
   }//movie_sub()
   
   //코멘트 저장
   @PostMapping("/com_write_ok")
   public String com_write_ok(ComVO c,RedirectAttributes rttr, HttpServletRequest request) throws Exception{
      
      String movienum=request.getParameter("movienum");
      String moviename=request.getParameter("moviename");
      System.out.println("영화 번호: "+movienum + "영화 이름: "+moviename);
      moviecomService.insertCom(c);
      rttr.addFlashAttribute("msg", "SUCCESS");
      //rttr.addFlashAttribute로 전달한 값은 url뒤에 붙지 않는다. 일회성이라 리프레시할 경우 데이터가 소멸한다.
      //또한 2개이상 쓸 경우, 데이터는 소멸한다. 따라서 맵을 이용하여 한번에 값전달해야한다.
      return "redirect:/com_list";
      
   }//com_write_ok()
   
   //코멘트 리스트
   @GetMapping("/com_list")
   public String com_list(Model m,HttpServletRequest request,ComVO c) {
      int page=1;
      int limit=5; //한페이지에 보여지는 목록개수
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      
      c.setStartrow((page-1)*5+1);
      c.setEndrow(c.getStartrow()+limit-1);
      
      int totalCount=this.moviecomService.getRowCount();//총 코멘트 개수
      //System.out.println("총개수: "+ totalCount);
      List<ComVO> clist=this.moviecomService.getComList(c); //코멘트 목록
      //System.out.println("코멘트 목록: "+clist);
      
      /*페이징 관련 연산*/
      int maxpage=(int)((double)totalCount/limit+0.95);//총 페이지 수
      int startpage=(((int)((double)page/10+0.9))-1)*10+1;//시작페이지
      int endpage=maxpage;//현재페이지에 보여질 마지막 페이지
      
      if(endpage > startpage+10-1) endpage=startpage+10-1;
      
      m.addAttribute("clist", clist);//list 키 이름에 목록 저장
      m.addAttribute("totalCount", totalCount);
      m.addAttribute("startpage", startpage);
      m.addAttribute("endpage", endpage);
      m.addAttribute("maxpage", maxpage);
      m.addAttribute("page", page);
      //m.addAttribute("com_num",com_num);
      
      return "movie/com_list";
         
   }
   
   //코멘트 수정폼
   @GetMapping("/com_edit")
   public String com_editPopUp(Model m, int com_num, int page,HttpServletRequest request,ComVO c) {
      c=moviecomService.getCont(com_num);
      
      //com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("번호 수정폼: " + com_num);
      System.out.println("수정할 내용: " + c.getCont_com());
      System.out.println("==========================>");
      
      //m.addAttribute("c", c);
      //m.addAttribute("com_num", com_num);
      //m.addAttribute("page", page);
      
      //추가
      page=1;
      int limit=5; //한페이지에 보여지는 목록개수
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      
      c.setStartrow((page-1)*5+1);
      c.setEndrow(c.getStartrow()+limit-1);
      
      int totalCount=this.moviecomService.getRowCount();//총 코멘트 개수
      //System.out.println("총개수: "+ totalCount);
      List<ComVO> clist=this.moviecomService.getComList(c); //코멘트 목록
      //System.out.println("코멘트 목록: "+clist);
      
      /*페이징 관련 연산*/
      int maxpage=(int)((double)totalCount/limit+0.95);//총 페이지 수
      int startpage=(((int)((double)page/10+0.9))-1)*10+1;//시작페이지
      int endpage=maxpage;//현재페이지에 보여질 마지막 페이지
      
      if(endpage > startpage+10-1) endpage=startpage+10-1;
      
      m.addAttribute("clist", clist);//list 키 이름에 목록 저장
      m.addAttribute("totalCount", totalCount);
      m.addAttribute("startpage", startpage);
      m.addAttribute("endpage", endpage);
      m.addAttribute("maxpage", maxpage);
      m.addAttribute("page", page);
      m.addAttribute("com_num", com_num);
      m.addAttribute("cont_com", c.getCont_com());
      
      return "movie/com_list2";
   }
   
   //수정완료
   @PostMapping("/com_edit_ok")
   public ModelAndView com_edit_ok(Model m,ComVO ec,int com_num, int page, HttpServletRequest request,RedirectAttributes rttr) {
      
      moviecomService.editCom(ec);
      
//      String cont_com=request.getParameter("cont_com");
//      System.out.println("코멘트: " +cont_com);
      //com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("번호: " + ec.getCom_num());
      System.out.println("페이지: " + page);
      System.out.println(ec.getCont_com());
      
      
      String movienum=request.getParameter("movienum");
      String moviename=request.getParameter("moviename");
      System.out.println("=================>");
      System.out.println("영화 번호: "+movienum + "영화 이름: "+moviename);
      
      ModelAndView cm=new ModelAndView();
      cm.setViewName("redirect:/com_list");
      cm.addObject("page", page);
      cm.addObject("com_num",com_num);
      return cm;
   
//      rttr.addFlashAttribute("msg", "SUCCESS");
//      return new ModelAndView("movie/com_list?page="+page);
      
   }
   
   //삭제
   @RequestMapping("com_del")
   public ModelAndView com_del(int com_num,int page,RedirectAttributes rttr,HttpServletRequest request) {
      this.moviecomService.delCom(com_num);
      
      com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("번호: " + com_num);
      
      rttr.addFlashAttribute("msg", "SUCCESS");
      return new ModelAndView("redirect:/com_list?page="+page);
   }
   

}