package ca.project.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ca.project.DTO.R_board_ReplyVO;
import ca.project.Service.ReviewReplyService;

@Controller
@RequestMapping("review_board_reply")
public class ReviewBoardReplyController {
	
	@Autowired
	private ReviewReplyService rb_reply_service;
	
	// 댓글 작성
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(R_board_ReplyVO rpvo) {
		rb_reply_service.insert(rpvo);
		return "redirect:/review_board/read?rb_no=" + rpvo.getRpy_bno();
	}
	
	// 댓글 삭제
	@RequestMapping(value = "delete/{rpy_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("rpy_no") int rpy_no) {
		R_board_ReplyVO rpvo = rb_reply_service.read(rpy_no);
		rb_reply_service.delete(rpy_no);
		return "redirect:/review_board/read?rb_no=" + rpvo.getRpy_bno();
	}
	

	
}
