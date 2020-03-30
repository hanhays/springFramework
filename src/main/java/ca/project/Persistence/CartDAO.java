package ca.project.Persistence;

import java.util.List;

import ca.project.DTO.CartVO;

public interface CartDAO {

	// 장바구니 담기
	void insert(CartVO cvo);
	
	// 장바구니 목록
	List<CartVO> list(String mem_id);
	
	// 장바구니 삭제
	void delete(int cart_no);

}
