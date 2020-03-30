package ca.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ca.project.DTO.OrderDetailsVO;
import ca.project.DTO.OrderVO;
import ca.project.Persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO order_dao;
	
	// 주문 생성
	@Override
	public void insert(OrderVO ovo) {
		order_dao.insert(ovo);
	}
	
	// 주문 상세보기 생성
	@Override
	public void insertDetails(OrderDetailsVO odvo) {
		order_dao.insertDetails(odvo);
	}
	
	// 카트비우기
	@Override
	public void delete(String mem_id) {
		order_dao.delete(mem_id);
	}
	
	
	// 사용자 주문 내역
	@Override
	public List<OrderVO> member_orderlist(String mem_id) {
		return order_dao.member_orderlist(mem_id);
	}
	
	// 사용자 주문내역 상세보기
	@Override
	public List<OrderDetailsVO> read(String order_idnumber) {
		return order_dao.read(order_idnumber);
	}
	
	// 관리자가 주문내역보기
	@Override
	public List<OrderVO> admin_orderlist() {
		return order_dao.admin_orderlist();
	}
	
	// 주문취소요청하기
	@Override
	public void cacel(String order_idnumber) {
		order_dao.cacel(order_idnumber);
	}
	
	
	// 배송하기
	@Override
	public void shipping(String order_idnumber) {
		order_dao.shipping(order_idnumber);
	}
	
	// 재고 업데이트
	@Override
	public void stockUpdate(OrderDetailsVO odvo) {
		order_dao.stockUpdate(odvo);
	}
	
	
}
