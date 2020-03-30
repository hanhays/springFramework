package ca.project.Service;

import ca.project.DTO.R_board_ReplyVO;

public interface ReviewReplyService {
	
	// 댓글 작성
	void insert(R_board_ReplyVO rpvo);
	
	// 댓글 삭제
	R_board_ReplyVO read(int rpy_no);
	void delete(int rpy_no);
	
}
