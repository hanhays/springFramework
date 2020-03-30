package ca.project.Persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ca.project.DTO.R_board_ReplyVO;

@Repository
public class R_board_ReplyDAOImpl implements R_board_ReplyDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.R_board_Reply";
	
	// 댓글 작성
	@Override
	public void insert(R_board_ReplyVO rpvo) {
		session.insert(NS + ".insert", rpvo);
	}
	
	// 댓글 삭제
	@Override
	public R_board_ReplyVO read(int rpy_no) {
		return session.selectOne(NS + ".read", rpy_no);
	}
	@Override
	public void delete(int rpy_no) {
		session.delete(NS + ".delete", rpy_no);
	}
	
	
	
}
