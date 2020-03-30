package ca.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ca.project.DTO.CartVO;
import ca.project.Persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cart_dao;
	
	// 장바구니 담기
	@Override
	public void insert(CartVO cvo) {
		cart_dao.insert(cvo);
	}
	

	// 장바구니 목록
	@Override
	public List<CartVO> list(String mem_id) {
		return cart_dao.list(mem_id);
	}
	
	// 장바구니 삭제
	@Override
	public void delete(int cart_no) {
		cart_dao.delete(cart_no);
	}
}
