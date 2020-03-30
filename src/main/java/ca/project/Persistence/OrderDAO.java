package ca.project.Persistence;

import java.util.List;

import ca.project.DTO.OrderDetailsVO;
import ca.project.DTO.OrderVO;

public interface OrderDAO {
	
	// 주문 생성
	void insert(OrderVO ovo);
	
	// 주문 상세보기 생성
	void insertDetails(OrderDetailsVO odvo);
	
	// 카트비우기
	void delete(String mem_id);
	
	// 사용자 주문 내역
	List<OrderVO> member_orderlist(String mem_id);
	
	// 사용자 주문내역 상세보기
	List<OrderDetailsVO> read(String order_idnumber);
	
	// 관리자가 주문내역보기
	List<OrderVO> admin_orderlist();
	
	// 주문취소요청하기
	void cacel(String order_idnumber);
	
	// 배송하기
	void shipping(String order_idnumber);
	
	// 재고 업데이트
	void stockUpdate(OrderDetailsVO odvo);

	
	
	

}
