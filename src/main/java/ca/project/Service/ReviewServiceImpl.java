package ca.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ca.project.DTO.PageTO;
import ca.project.DTO.R_boardVO;
import ca.project.DTO.R_board_ReplyVO;
import ca.project.DTO.WineDTO;
import ca.project.Persistence.R_boardDAO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private R_boardDAO rdao;
	
	// 글쓰기
	@Override
	public void insert(R_boardVO rvo) {
		rdao.insert(rvo);
	}
	
	// 글목록
	@Override
	public PageTO list(PageTO to) {
		
		int amount = rdao.getAmount();
		to.setAmount(amount);
		List<R_boardVO> rlist = rdao.getListpage(to);
		to.setRlist(rlist);
		
		return to;
	}
	
	// 글 자세히 보기
	@Override
	public R_boardVO read(int rb_no) {
		rdao.updateRb_readcnt(rb_no);	// 조회수 증가
		return rdao.read(rb_no);
	}
	// 댓글 목록
	@Override
	public List<R_board_ReplyVO> replyList(int rb_no) {
		return rdao.replyList(rb_no);
	}
	
	// 글 수정하기
	@Override
	public void update(R_boardVO rvo) {
		rdao.update(rvo);
	}
	
	// 글 삭제
	@Override
	public void delete(int rb_no) {
		rdao.delete(rb_no);
	}
	
	
	// 사용자 구매상품 목록보기
	@Override
	public List<WineDTO> orderWineList(String mem_id) {
		return rdao.orderWineList(mem_id);
	}
	
	
	
	
}
