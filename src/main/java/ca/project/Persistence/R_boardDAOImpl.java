package ca.project.Persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import ca.project.DTO.PageTO;
import ca.project.DTO.R_boardVO;
import ca.project.DTO.R_board_ReplyVO;
import ca.project.DTO.WineDTO;

@Repository
public class R_boardDAOImpl implements R_boardDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.R_board";
	
	// 글쓰기
	@Override
	public void insert(R_boardVO rvo) {
		session.insert(NS + ".insert", rvo);
	}
	
	// 글목록
	@Override
	public int getAmount() {
		return session.selectOne(NS + ".getAmount");
	}
	@Override
	public List<R_boardVO> getListpage(PageTO to) {
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS + ".getListpage", null, rb);
	}
	
	// 글 자세히 보기
	@Override
	public R_boardVO read(int rb_no) {
		return session.selectOne(NS + ".read", rb_no);
	}
	// 조회수 증가
	@Override
	public void updateRb_readcnt(int rb_no) {
		session.update(NS + ".updateRb_readcnt", rb_no);
	}
	
	// 댓글 목록
	@Override
	public List<R_board_ReplyVO> replyList(int rb_no) {
		return session.selectList(NS + ".replyList", rb_no);
	}
	
	// 글 수정하기
	@Override
	public void update(R_boardVO rvo) {
		session.update(NS + ".update", rvo);
	}
	
	// 글 삭제
	@Override
	public void delete(int rb_no) {
		session.delete(NS + ".delete", rb_no);
	}
	
	
	// 사용자 구매상품 목록보기
	@Override
	public List<WineDTO> orderWineList(String mem_id) {
		return session.selectList(NS + ".orderWineList", mem_id);
	}
	
	
	
	
}
