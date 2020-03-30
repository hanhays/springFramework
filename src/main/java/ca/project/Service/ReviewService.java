package ca.project.Service;

import java.util.List;

import ca.project.DTO.PageTO;
import ca.project.DTO.R_boardVO;
import ca.project.DTO.R_board_ReplyVO;
import ca.project.DTO.WineDTO;

public interface ReviewService {
	
	// 글쓰기
	void insert(R_boardVO rvo);
	
	// 글목록
	PageTO list(PageTO to);
	
	// 글 자세히 보기
	R_boardVO read(int rb_no);
	// 댓글 목록
	List<R_board_ReplyVO> replyList(int rb_no);
	
	// 글 수정하기
	void update(R_boardVO rvo);
	
	// 글 삭제
	void delete(int rb_no);
	
	// 사용자 구매상품 목록보기
	List<WineDTO> orderWineList(String mem_id);
	
	
}
