package ca.project.Persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ca.project.DTO.CartVO;
import ca.project.DTO.MemberDTO;
import ca.project.DTO.PageTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.Member";
	
	// 회원가입
	@Override
	public void insert(MemberDTO dto) {
		session.insert(NS + ".insert", dto);
	}
	
	// id 중복검사
	@Override
	public String checkid(String id) {
		return session.selectOne(NS + ".checkid", id);
	}
	
	// 회원목록(페이지처리포함)
	@Override
	public int getAmount() {
		return session.selectOne(NS + ".getAmount");
	}
	
	// 회원목록(페이지처리포함)
	@Override
	public List<MemberDTO> getListpage(PageTO to) {
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS + ".getListpage", null, rb);
	}
	
	// 회원정보 자세히 보기
	@Override
	public MemberDTO read(String mem_id) {
		return session.selectOne(NS + ".read", mem_id);
	}
	
	// 회원정보 수정하기
	@Override
	public void update(MemberDTO dto) {
		session.update(NS + ".update", dto);
	}
	
	// 회원 삭제
	@Override
	public void delete(String mem_id) {
		session.delete(NS + ".delete", mem_id);	
	}
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) {
		return session.selectOne(NS + ".login", dto);
	}
	
	// 홈페이지에서 장바구니 리스트 가지고 오기
	@Override
	public List<CartVO> list(String mem_id) {
		return session.selectList(NS + ".list", mem_id);
	}



}
