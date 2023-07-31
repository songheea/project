package controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Paging;
import common.ViewPath;
import service.board.BoardService;
import vo.board.BoardVO;

@Controller
public class BoardController {

	private BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("/board/list")
	public String list(Model model,Integer page,String type,String word) {
		
		if(page == null) {
			page = 1;
		}
		
		if(type != null && type.equals("")) {
			type = null;
			word = null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type",type);
		map.put("word",word);
		
		int boardCount = boardService.getTotal(map);
		
		
		Paging paging = new Paging(page, boardCount);
		
	
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<BoardVO> list = boardService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return ViewPath.BOARD + "list.jsp";
	}
	
	@RequestMapping("/board/writeform")
	public String writeForm() {
		return ViewPath.BOARD + "write.jsp";
	}
	
	@RequestMapping("/board/write")
	public String wirte(Model model,HttpSession session, BoardVO vo) {
		
		Integer no = (Integer)session.getAttribute("login");
		
		if(no == null) {
			return "redirect:/login/loginform";
		}
		
		vo.setNo(no);		
		
		int su = boardService.insert(vo);
		
		model.addAttribute("su", su);
		model.addAttribute("status", "write");
		model.addAttribute("url", "/myhome/board/list");
		
		return ViewPath.BOARD + "result.jsp";
	}
	
	@RequestMapping("/board/content")
	public String content(Model model,int seq) {
		
		//BoardVO map = boardService.selectOne(seq);
		Map<String, Object> map = boardService.getContent(seq);
		
		model.addAttribute("vo", map);
		
		return ViewPath.BOARD + "content.jsp";
	}
	
	@RequestMapping("/board/updateform")
	public String updateForm(Model model,int seq) {
		BoardVO vo = boardService.selectOne(seq);
		
		String content = vo.getContent();
		
		vo.setContent(content.replaceAll("<br>", "\r\n"));
		
		model.addAttribute("vo", vo);
		
		return ViewPath.BOARD + "update.jsp";
	}
	
	@RequestMapping("/board/update")
	public String update(Model model,BoardVO vo) {
		
		String content = vo.getContent();
		
		vo.setContent(content.replaceAll("\r\n", "<br>"));
		
		
		
		int su = boardService.update(vo);
		
		
		
		model.addAttribute("su", su);
		model.addAttribute("status", "update");
		model.addAttribute("url", "/myhome/board/content?seq=" + vo.getSeq());
		
		return ViewPath.BOARD + "result.jsp";
		
	}
	
	@RequestMapping("/board/delete")
	public String delete(Model model,int seq) {
		
		
		int su = boardService.delete(seq);
		
		model.addAttribute("su", su);
		model.addAttribute("status", "delete");
		model.addAttribute("url", "/myhome/board/list");
		
		return ViewPath.BOARD + "result.jsp";
	}
	
	@RequestMapping("/board/reply/{seq}")
	public String reply(Model model,@PathVariable("seq") int seq) {
		model.addAttribute("seq", seq);
		
		return ViewPath.BOARD + "write.jsp";
	}
}



















