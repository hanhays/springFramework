package ca.project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ca.project.DTO.R_board_ReplyVO;
import ca.project.Persistence.R_board_ReplyDAO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService{
	
	@Autowired
	private R_board_ReplyDAO rpdao;
	
	// 댓글 작성
	@Override
	public void insert(R_board_ReplyVO rpvo) {
		rpdao.insert(rpvo);
	}
	
	// 댓글 삭제
	@Override
	public R_board_ReplyVO read(int rpy_no) {
		return rpdao.read(rpy_no);
	}
	@Override
	public void delete(int rpy_no) {
		rpdao.delete(rpy_no);
	}
	
	
	
	
}
