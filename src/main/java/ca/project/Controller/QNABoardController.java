package ca.project.Controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ca.project.DTO.PageTO;
import ca.project.DTO.Q_boardVO;
import ca.project.Service.QNAService;

@Controller
@RequestMapping("qna_board")
public class QNABoardController {
	
	@Inject
	private QNAService qb_service;
	
	@RequestMapping("list")
	public String list(PageTO qto, Model model) {
		qto = qb_service.list(qto);
		model.addAttribute("qto", qto);
		return "qna_board/qb_list";
	}
	
	@RequestMapping("insert")
	public String insertui() {
		return "qna_board/qb_insert";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(Q_boardVO qvo) {
		qb_service.insert(qvo);
		return "redirect:/qna_board/list";
	}
	
	@RequestMapping("reply/{qb_no}")
	public String replyui(@PathVariable("qb_no") int qb_no, Model model) {
		Q_boardVO qvo = qb_service.replyui(qb_no);
		model.addAttribute("qvo", qvo);
		return "qna_board/qb_reply";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String reply(Q_boardVO qvo, int parent_qb_root, int parent_qb_step, int parent_qb_indent) {
		qb_service.reply(qvo, parent_qb_root, parent_qb_step, parent_qb_indent);
		return "redirect:/qna_board/read/"+qvo.getqb_no();
	}
	
	@RequestMapping("read/{qb_no}")
	public String read(@PathVariable("qb_no") int qb_no, Model model) {
		Q_boardVO qvo = qb_service.read(qb_no);
		model.addAttribute("qvo", qvo);
		return "qna_board/qb_read";
	}
	
	@RequestMapping("update/{qb_no}")
	public String updateui(@PathVariable("qb_no") int qb_no, Model model) {
		Q_boardVO qvo = qb_service.updateui(qb_no);
		model.addAttribute("qvo", qvo);
		return "qna_board/qb_update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Q_boardVO qvo) {
		qb_service.update(qvo);
		return "redirect:/qna_board/read/"+qvo.getqb_no();
	}
	
	@RequestMapping("delete/{qb_no}")
	public String delete(@PathVariable("qb_no") int qb_no) {
		qb_service.delete(qb_no);
		return "redirect:/qna_board/list";
	}
	
}
