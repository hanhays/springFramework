package ca.project.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import ca.project.DTO.CartVO;
import ca.project.DTO.MemberDTO;
import ca.project.DTO.PageTO;

public interface MemberService {
	
	// 회원가입
	public abstract void insert(MemberDTO dto);
	
	// id 중복검사
	public abstract String checkid(String id);
	
	// 회원목록(페이지처리포함)
	public abstract PageTO list(PageTO to);
	
	// 회원정보 자세히 보기
	public abstract MemberDTO read(String mem_id);
	
	// 회원정보 수정하기
	public abstract void update(MemberDTO dto);
	
	// 회원 삭제
	public abstract void delete(String mem_id);
	
	// 로그인
	public abstract MemberDTO login(MemberDTO dto);
	
	// 로그아웃
	public abstract void logout(HttpSession session);
	
	// 홈페이지에서 장바구니 리스트 가지고 오기
	public abstract List<CartVO> list(String mem_id);
	
}
