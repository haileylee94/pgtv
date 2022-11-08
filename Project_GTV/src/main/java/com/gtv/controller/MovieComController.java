package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
   
   //  ȭ    Ʈ
   @GetMapping("/movie")
   public ModelAndView movie(HttpServletRequest request) {
      
      ModelAndView m = new ModelAndView();
      m.setViewName("movie/movie");
      return m;
   }
   
   
//   //  ȭ       
//   @GetMapping("/movie_sub")
//   public ModelAndView movie_sub(HttpServletRequest request) {
//      
//      ModelAndView m = new ModelAndView();
//      m.setViewName("movie/movie_sub");
//      return m;
//   }
   
   //  ȭ         +         ڸ Ʈ     
   @GetMapping("/movie_sub")
   public ModelAndView com_write(HttpServletRequest request, MovieVO movieVo) {
      int page=1;
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      ModelAndView mv = new ModelAndView();
      movieVo.setMovienum(1);
      movieVo.setMoviename("    2");
      mv.setViewName("movie/movie_sub");// 丮             .               δ  
      // /WEB-INF/views/movie/com_write.jsp
      mv.addObject("page", page);
      return mv;
   }//movie_sub()
   
   // ڸ Ʈ     
   @PostMapping("/com_write_ok")
   public String com_write_ok(ComVO c,RedirectAttributes rttr, HttpServletRequest request, Authentication auth) throws Exception{
      
	  String id = auth.getName();
	  
      String movienum=request.getParameter("movienum");
      String moviename=request.getParameter("moviename");
      System.out.println("  ȭ   ȣ: "+movienum + "  ȭ  ̸ : "+moviename);
      moviecomService.insertCom(c);
      rttr.addFlashAttribute("msg", "SUCCESS");
      //rttr.addFlashAttribute               url ڿ        ʴ´ .   ȸ   ̶                      Ͱ   Ҹ  Ѵ .
      //     2   ̻        ,      ʹ   Ҹ  Ѵ .            ̿  Ͽ   ѹ           ؾ  Ѵ .
      return "redirect:/com_list";
      
   }//com_write_ok()
   
   // ڸ Ʈ     Ʈ
   @GetMapping("/com_list")
   public String com_list(Model m,HttpServletRequest request,ComVO c) {
      int page=1;
      int limit=5; //                      ϰ   
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      
      c.setStartrow((page-1)*5+1);
      c.setEndrow(c.getStartrow()+limit-1);
      
      int totalCount=this.moviecomService.getRowCount();//    ڸ Ʈ     
      //System.out.println(" Ѱ   : "+ totalCount);
      List<ComVO> clist=this.moviecomService.getComList(c); // ڸ Ʈ    
      //System.out.println(" ڸ Ʈ    : "+clist);
      
      /*    ¡          */
      int maxpage=(int)((double)totalCount/limit+0.95);//            
      int startpage=(((int)((double)page/10+0.9))-1)*10+1;//          
      int endpage=maxpage;//                                 
      
      if(endpage > startpage+10-1) endpage=startpage+10-1;
      
      m.addAttribute("clist", clist);//list Ű  ̸            
      m.addAttribute("totalCount", totalCount);
      m.addAttribute("startpage", startpage);
      m.addAttribute("endpage", endpage);
      m.addAttribute("maxpage", maxpage);
      m.addAttribute("page", page);
      //m.addAttribute("com_num",com_num);
      
      return "movie/com_list";
         
   }
   
   // ڸ Ʈ       
   @GetMapping("/com_edit")
   public String com_editPopUp(Model m, int com_num, int page,HttpServletRequest request,ComVO c) {
      c=moviecomService.getCont(com_num);
      
      //com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("  ȣ       : " + com_num);
      System.out.println("==========================>");
      
      //m.addAttribute("c", c);
      //m.addAttribute("com_num", com_num);
      //m.addAttribute("page", page);
      
      // ߰ 
      page=1;
      int limit=5; //                      ϰ   
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      
      c.setStartrow((page-1)*5+1);
      c.setEndrow(c.getStartrow()+limit-1);
      
      int totalCount=this.moviecomService.getRowCount();//    ڸ Ʈ     
      //System.out.println(" Ѱ   : "+ totalCount);
      List<ComVO> clist=this.moviecomService.getComList(c); // ڸ Ʈ    
      //System.out.println(" ڸ Ʈ    : "+clist);
      
      /*    ¡          */
      int maxpage=(int)((double)totalCount/limit+0.95);//            
      int startpage=(((int)((double)page/10+0.9))-1)*10+1;//          
      int endpage=maxpage;//                                 
      
      if(endpage > startpage+10-1) endpage=startpage+10-1;
      
      m.addAttribute("clist", clist);//list Ű  ̸            
      m.addAttribute("totalCount", totalCount);
      m.addAttribute("startpage", startpage);
      m.addAttribute("endpage", endpage);
      m.addAttribute("maxpage", maxpage);
      m.addAttribute("page", page);
      m.addAttribute("com_num", com_num);
      
      return "movie/com_list2";
   }
   
   //     Ϸ 
   @PostMapping("/com_edit_ok")
   public ModelAndView com_edit_ok(Model m,ComVO ec,int com_num, int page, HttpServletRequest request,RedirectAttributes rttr) {
      
      moviecomService.editCom(ec);
      
//      String cont_com=request.getParameter("cont_com");
//      System.out.println(" ڸ Ʈ: " +cont_com);
      //com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("  ȣ: " + ec.getCom_num());
      System.out.println("      : " + page);
      System.out.println(ec.getCont_com());
      
      
      String movienum=request.getParameter("movienum");
      String moviename=request.getParameter("moviename");
      System.out.println("=================>");
      System.out.println("  ȭ   ȣ: "+movienum + "  ȭ  ̸ : "+moviename);
      
      ModelAndView cm=new ModelAndView();
      cm.setViewName("redirect:/com_list");
      cm.addObject("page", page);
      cm.addObject("com_num",com_num);
      return cm;
   
//      rttr.addFlashAttribute("msg", "SUCCESS");
//      return new ModelAndView("movie/com_list?page="+page);
      
   }
   
   //    
   @RequestMapping("com_del")
   public ModelAndView com_del(int com_num,int page,RedirectAttributes rttr,HttpServletRequest request) {
      this.moviecomService.delCom(com_num);
      
      com_num =Integer.parseInt(request.getParameter("com_num"));
      System.out.println("  ȣ: " + com_num);
      
      rttr.addFlashAttribute("msg", "SUCCESS");
      return new ModelAndView("redirect:/com_list?page="+page);
   }
   

}