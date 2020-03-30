package ca.project.Persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ca.project.DTO.OrderDetailsVO;
import ca.project.DTO.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.Order";
	
	// 주문 생성
	@Override
	public void insert(OrderVO ovo) {
		session.insert(NS + ".insert", ovo);
	}
	
	// 주문 상세보기 생성
	@Override
	public void insertDetails(OrderDetailsVO odvo) {
		session.insert(NS + ".insertDetails", odvo);
	}
	
	// 카트비우기
	@Override
	public void delete(String mem_id) {
		session.delete(NS + ".delete", mem_id);
	}
	
	// 사용자 주문 내역
	@Override
	public List<OrderVO> member_orderlist(String mem_id) {
		return session.selectList(NS + ".member_orderlist", mem_id);
	}
	
	// 사용자 주문내역 상세보기
	@Override
	public List<OrderDetailsVO> read(String order_idnumber) {
		return session.selectList(NS + ".read", order_idnumber);
	}
	
	
	// 관리자가 주문내역보기
	@Override
	public List<OrderVO> admin_orderlist() {
		return session.selectList(NS + ".admin_orderlist");
	}
	
	
	// 주문취소요청하기
	@Override
	public void cacel(String order_idnumber) {
		session.update(NS + ".cacel", order_idnumber);
	}
	
	
	// 배송하기
	@Override
	public void shipping(String order_idnumber) {
		session.update(NS + ".shipping", order_idnumber);
	}
	
	// 재고 업데이트
	@Override
	public void stockUpdate(OrderDetailsVO odvo) {
		session.update(NS + ".stockUpdate", odvo);
	}
	
	
	
}
