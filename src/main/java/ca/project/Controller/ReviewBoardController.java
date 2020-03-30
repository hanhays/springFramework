package ca.project.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ca.project.DTO.MemberDTO;
import ca.project.DTO.PageTO;
import ca.project.DTO.R_boardVO;
import ca.project.DTO.R_board_ReplyVO;
import ca.project.DTO.WineDTO;
import ca.project.Service.ReviewService;

@Controller
@RequestMapping("review_board")
public class ReviewBoardController {
	
	@Autowired
	private ReviewService rb_service;
	
	// 글쓰기 get
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertui(HttpSession session, Model model) {
		
		// 사용자 구매상품 목록보기
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String mem_id = dto.getMem_id();
		List<WineDTO> owlist = rb_service.orderWineList(mem_id);
		model.addAttribute("owlist", owlist);
		
		return "review_board/rb_insert";
	}
	
	// 글쓰기 post
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(R_boardVO rvo) {
		rb_service.insert(rvo);
		return "redirect:/review_board/list";
	}
	
	// 글목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(PageTO to, Model model) {
		to = rb_service.list(to);
		model.addAttribute("to", to);
		return "review_board/rb_list";
	}
	
	// 글 자세히 보기
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(@RequestParam("rb_no") int rb_no, Model model) {
		R_boardVO rvo = rb_service.read(rb_no);
		model.addAttribute("rvo", rvo);
		
		// 댓글 목록
		List<R_board_ReplyVO> replylist = rb_service.replyList(rb_no);
		model.addAttribute("replylist", replylist);
		
		return "review_board/rb_read";
	}
	
	// 글 수정하기 get
	@RequestMapping(value = "update/{rb_no}", method = RequestMethod.GET)
	public String updateui(@PathVariable("rb_no") int rb_no, Model model) {
		R_boardVO rvo = rb_service.read(rb_no);
		model.addAttribute("rvo", rvo);
		return "review_board/rb_update";
	}
	
	// 글 수정하기 post
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(R_boardVO rvo) {
		rb_service.update(rvo);
		return "redirect:/review_board/read?rb_no="+rvo.getRb_no();
	}
	
	// 글 삭제
	@RequestMapping(value = "delete/{rb_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("rb_no") int rb_no) {
		rb_service.delete(rb_no);
		return "redirect:/review_board/list";
	}
	
	
}
