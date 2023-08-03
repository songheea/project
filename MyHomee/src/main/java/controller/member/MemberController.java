package controller.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.member.MemberService;
import vo.member.MemberVO;

@Controller
public class MemberController {

	private MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("/member/joinform")
	public String joinForm() {
		return ViewPath.MEMBER + "joinForm.jsp";
	}
	
	@RequestMapping("/member/join")
	public String join(Model model,MemberVO vo) {
		int su = memberService.insert(vo);
		
		String url = null;
		String msg = null;
		
		if(su != 0){
			msg = "회원가입 성공!..로그인페이지로..";
			url = "/myhome/login/loginform?id=" + vo.getId();		
		}else{
			msg = "회원가입 실패!..이전페이지로..";
			url = "history.back()";		
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return ViewPath.MEMBER + "result.jsp";
	}
	
	@RequestMapping("/member/mypage")
	public String myPage(Model model,HttpSession session) {
		Integer no = (Integer)session.getAttribute("login");
		
		if(no == null) {
			return "redirect:/login/loginform";
		}
		
		MemberVO vo = memberService.selectOne(no);
		
		model.addAttribute("vo", vo);
		
		return ViewPath.MEMBER + "myPage.jsp";
	}
	
	@RequestMapping("/member/updateform")
	public String updateForm(Model model,HttpSession session) {
		
		Integer no = (Integer)session.getAttribute("login");
		
		if(no == null) {
			return "redirect:/login/loginform";
		}
		
		MemberVO vo = memberService.selectOne(no);
		
		model.addAttribute("vo", vo);
		
		return ViewPath.MEMBER + "updateForm.jsp";
	}

	@RequestMapping("/member/deleteform")
	public String updateForm() {
		
		return ViewPath.MEMBER + "deleteForm.jsp";
	}
	
	@RequestMapping("/member/update")
	public String update(Model model,HttpSession session,MemberVO vo) {
		
		Integer no = (Integer)session.getAttribute("login");
		
		if(no == null) {
			return "redirect:/login/loginform";
		}
		
		vo.setNo(no);
		
		int su = memberService.update(vo);
		
		String msg = null;
		String url = null;
		
		if(su != 0){
			msg = "수정완료!!MyPage로...";
			url = "/myhome/member/mypage";
		}else{
			msg = "수정실패!!이전페이지로...";
			url = "/myhome/member/updateform";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return ViewPath.MEMBER + "result.jsp";
	}
	
	@RequestMapping("/member/delete")
	public String delete(HttpServletRequest request,HttpServletResponse response,String password) {
		
		Integer no = (Integer)request.getSession().getAttribute("login");
		
		if(no == null) {
			return "redirect:/login/loginform";
		}
		
		MemberVO vo = memberService.selectOne(no);
		
		String msg = null;
		String url = null;
		
		if(!vo.getPassword().equals(password)) {
			msg = "비밀번호가 틀렸습니다. 이전페이지로...";
			url = "/myhome/member/deleteform";
		}else {
			int su = memberService.delete(no);
			
			if(su != 0) {
				msg = "탈퇴 성공..";
				url = "/myhome/";
				
				Cookie[] cks = request.getCookies();
				
				if(cks != null) {
					for(Cookie ck:cks) {
						if(ck.getName().equals("ckid")) {
							if(ck.getValue().equals(vo.getId())) {
								ck.setMaxAge(0);
								ck.setPath("/");
								response.addCookie(ck);
								break;
							}
						}
					}
				}
				
				request.getSession().invalidate();
				
			}else {
				msg = "탈퇴 실패. 이전페이지로...";
				url = "/myhome/member/deleteform";
			}
		}
		
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		
		return ViewPath.MEMBER + "result.jsp";
	}
	
	@RequestMapping(value = "/member/checkId" ,produces = "application/text;charset=utf8" )
	@ResponseBody
	public String checkId(String id) {
		System.out.println("????");
		if(memberService.checkId(id)) {
			return "이미 사용중인 ID입니다.";
		}else {
			return "사용 가능한 ID입니다";
		}
	}
}


























