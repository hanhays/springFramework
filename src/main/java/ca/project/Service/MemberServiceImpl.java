package ca.project.Service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ca.project.DTO.CartVO;
import ca.project.DTO.MemberDTO;
import ca.project.DTO.PageTO;
import ca.project.Persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO member_dao;
	
	// 회원가입
	@Override
	public void insert(MemberDTO dto) {
		member_dao.insert(dto);
	}
	
	// id 중복검사
	@Override
	public String checkid(String id) {
		return member_dao.checkid(id);
	}
	
	// 회원목록(페이지처리포함)
	@Override
	public PageTO list(PageTO to) {
		int amount = member_dao.getAmount();
		to.setAmount(amount);
		List<MemberDTO> list = member_dao.getListpage(to);
		to.setList(list);
		return to;
	}
	
	// 회원정보 자세히 보기
	@Override
	public MemberDTO read(String mem_id) {
		return member_dao.read(mem_id);
	}
	
	// 회원정보 수정하기
	@Override
	public void update(MemberDTO dto) {
		member_dao.update(dto);	
	}
	
	// 회원 삭제
	@Override
	public void delete(String mem_id) {
		member_dao.delete(mem_id);
	}
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) {
		return member_dao.login(dto);
	}
	
	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	// 홈페이지에서 장바구니 리스트 가지고 오기
	@Override
	public List<CartVO> list(String mem_id) {
		return member_dao.list(mem_id);
	}

}
