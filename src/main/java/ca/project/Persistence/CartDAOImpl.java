package ca.project.Persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ca.project.DTO.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.Cart";
	
	
	// 장바구니 담기
	@Override
	public void insert(CartVO cvo) {
		session.insert(NS + ".insert", cvo);
	}
	
	// 장바구니 목록
	@Override
	public List<CartVO> list(String mem_id) {
		return session.selectList(NS + ".list", mem_id);
	}
	
	// 장바구니 삭제
	@Override
	public void delete(int cart_no) {
		session.delete(NS + ".delete", cart_no);
	}
}
