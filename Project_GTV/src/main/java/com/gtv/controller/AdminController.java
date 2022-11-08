package com.gtv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gtv.service.AdminService;
import com.gtv.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @Autowired
   private AdminService adminService;
   
   @RequestMapping("/main")
   public ModelAndView main() {
      
      ModelAndView m = new ModelAndView();
      m.setViewName("admin/admin_main");
      return m;
   }
   
   @RequestMapping("/member")
   public String member(Model m, MemberVO mem, HttpServletRequest request) {
      
      int page = 1;
      int limit = 5; // �� ���������� �������� ��� ����
      if(request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }
      mem.setStartrow((page-1)*5 + 1); // ���� �� ��ȣ
      mem.setEndrow(mem.getStartrow() + limit - 1); // ���� ��ȣ
      // �ᱹ �� ���������� �˻��Ǵ� ��� ������ 5���� ���ѵȴ�.
      
      int totalCount = this.adminService.getRowCount(); //�ѷ��ڵ� ����
      List<MemberVO> memlist = this.adminService.getBoardList(mem); // �Խ��� ���
      
      // ����¡ �� �ʳ����� ���� ����
      int maxpage = (int)((double)totalCount/limit + 0.95); // �� ������ ��
      int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; // ���� ������
      int endpage = maxpage; // ���� �������� ������ ������ ������
      
      if(endpage > startpage + 10 - 1) endpage = startpage + 10 - 1;
      
      m.addAttribute("list", memlist); // listŰ �̸��� ��� ����
      m.addAttribute("totalCount", totalCount);
      m.addAttribute("startpage", startpage);
      m.addAttribute("endpage", endpage);
      m.addAttribute("maxpage", maxpage);
      m.addAttribute("page", page);
      
      return "admin/admin_member";
   }
   
   @RequestMapping("/movie")
   public ModelAndView movie(Authentication auth) {
      
      String name = auth.getName();
      System.out.println(auth.getName());
      
      ModelAndView m = new ModelAndView();
      m.addObject("id", name);
      m.setViewName("admin/admin_movie");
      return m;
   }
}