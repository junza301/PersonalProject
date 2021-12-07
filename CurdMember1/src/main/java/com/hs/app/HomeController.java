package com.hs.app;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hs.app.bean.CBookDTO;
import com.hs.app.bean.CBookListDTO;
import com.hs.app.bean.CCinemaDTO;
import com.hs.app.bean.CMemberDTO;
import com.hs.app.bean.CMovieDTO;
import com.hs.app.bean.CScreenDTO;
import com.hs.app.dao.CBookDAO;
import com.hs.app.dao.CCinemaDAO;
import com.hs.app.dao.CMemberDAO;
import com.hs.app.dao.CMovieDAO;
import com.hs.app.dao.CScreenDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	CMemberDAO CMemberdao;
	
	@Autowired
	CMovieDAO CMoviedao;
	
	@Autowired
	CCinemaDAO CCinemadao;
	
	@Autowired
	CScreenDAO CScreendao;
	
	@Autowired
	CBookDAO CBookdao;
	
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
	
	@RequestMapping("/book.do")
	public String Book(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		CMemberDTO dto = (CMemberDTO) session.getAttribute("dto");
		if(dto == null || dto.equals(""))
			return "redirect:/login.do";
		
		model.addAttribute("Clist", CCinemadao.cinemaGetAll());
		model.addAttribute("Mlist", CMoviedao.movieGetAll());
		return "book";
	}
	
	@RequestMapping("/bookproc.do")
	public String Bookproc(HttpServletRequest request) {
		String cinema = request.getParameter("cinema");
		String movie = request.getParameter("movie");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		int adult = Integer.parseInt(request.getParameter("adult"));
		int children = Integer.parseInt(request.getParameter("children"));
		
		HttpSession session = request.getSession();
		CMemberDTO dto = (CMemberDTO) session.getAttribute("dto");
		int member_idx = dto.getIdx();
		
		
		//영화관,영화 DTO 받아오기	
		CCinemaDTO cinema_dto = CCinemadao.cinemaGetIdx(cinema);
		CMovieDTO movie_dto = CMoviedao.movieGetIdx(movie);
		int cinema_idx = cinema_dto.getIdx();
		int movie_idx = movie_dto.getIdx();

		//상영정보 DTO 받아오기
		CScreenDTO screen_dto = CScreendao.screenGetOne(cinema_idx, movie_idx, time);
		int remain_seat = screen_dto.getRemain_seat();
		
		//남은좌석이 없다면 오류페이지
		if(remain_seat < adult + children) {
			return "redirect:/error.do";
		}
		
		CBookdao.bookInsert(member_idx, cinema_idx, movie_idx, date, time, adult+children);
		CScreendao.screenUpdate(remain_seat-(adult+children), cinema_idx, movie_idx, date, time);
		return "redirect:/success.do";
	}
	
	@RequestMapping("/error.do")
	public String Errorpage() {
		return "error";
	}
	
	@RequestMapping("/success.do")
	public String successpage() {
		return "success";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		CMemberDTO medto = (CMemberDTO) session.getAttribute("dto");	
		List<CBookDTO> bdto = CBookdao.bookMember(medto.getIdx());	
	
		model.addAttribute("mdto", medto);
		model.addAttribute("bdto", bdto);
		return "mypage";
	}
}
