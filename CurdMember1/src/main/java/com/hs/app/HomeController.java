package com.hs.app;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hs.app.bean.CMemberDTO;
import com.hs.app.dao.CMemberDAO;
import com.hs.app.dao.CMovieDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	CMemberDAO CMemberdao;
	
	@Autowired
	CMovieDAO CMoviedao;
	
	@RequestMapping(value = "/main.do")
	public String home(Model model) {	
		model.addAttribute("main", CMoviedao.movieGetMain());
		return "main";
	}
	
	@RequestMapping("/signup.do")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping("/signupProc.do")
	public String signupProc(CMemberDTO dto) {
		CMemberdao.memberInsert(dto);
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
		List<CMemberDTO> search = CMemberdao.memberSearch(id, pw);
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
	
	
	@RequestMapping("/list.do")
	public String listMember(Model model, HttpServletRequest request) {
		String now_ = request.getParameter("now");
		int now = 1;
		if(now_ != null && now_ != "")
			now = Integer.parseInt(now_);
		
		int total = CMoviedao.movieGetCount();
		int totalpage;
		if(total % 5 == 0)
			totalpage = total/5;
		else
			totalpage = total/5 + 1;
		
		int start;
		int end;
		
		if(now == 1 || now == 2 || now == 3) {
			if(totalpage < 5) {
				start = 1;
				end = totalpage;
			} else {
				start = 1;
				end = 5;
			}
		} else if(now == totalpage || now == totalpage-1 || now == totalpage-2) {
			if(totalpage < 5) {
				start = 1;
				end = totalpage;
			} else {
				start = totalpage-4;
				end = totalpage;
			}
		} else {
			start = now-2;
			end = now+2;
		}
			
		model.addAttribute("now", now);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("main", CMoviedao.movieGetMain());
		model.addAttribute("list", CMoviedao.movieGetFive(now));
		return "list";
	}
	
	
}
