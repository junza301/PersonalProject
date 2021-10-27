package com.hs.app;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hs.app.bean.CMemberDTO;
import com.hs.app.dao.CMemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	CMemberDAO dao;
	
	@RequestMapping(value = "/main.do")
	public String home(Model model) {			
		return "main";
	}
	
	@RequestMapping("/signup.do")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping("/signupProc.do")
	public String signupProc(CMemberDTO dto) {
		dao.memberInsert(dto);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/loginProc.do")
	public String loginProc(HttpServletRequest request,
							@RequestParam(value = "id", required = false) String id,
							@RequestParam(value = "pw", required = false) String pw) {
		List<CMemberDTO> search = dao.memberSearch(id, pw);
		if(search.size() != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("dto", search.get(0));
			return "redirect:/main.do";
		} else {
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	
	
	@RequestMapping("/MemberList.do")
	public String listMember(Model model) {
		model.addAttribute("list", dao.memberGetAll());
		model.addAttribute("total", dao.memberGetCount());
		return "list";
	}
	
	
}
