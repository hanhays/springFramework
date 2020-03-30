package ca.project.Controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.project.DTO.CartVO;
import ca.project.DTO.MemberDTO;
import ca.project.DTO.OrderDetailsVO;
import ca.project.DTO.OrderVO;
import ca.project.Service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private OrderService order_service;
	
	// 주문 생성
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(OrderVO ovo, OrderDetailsVO odvo, HttpSession session) {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String mem_id = dto.getMem_id();
				
		// 캘린더 호출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);  // 연도 추출
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);  // 월 추출
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));  // 일 추출
		String subNum = "";  // 랜덤 숫자를 저장할 문자열 변수
		
		for(int i = 1; i <= 6; i ++) {  // 6회 반복
			subNum += (int)(Math.random() * 10);  // 0~9까지의 숫자를 생성하여 subNum에 저장
		}
		String order_idnumber = ymd + "_" + subNum;  // [연월일]_[랜덤숫자] 로 구성된 문자
		
		ovo.setOrder_memId(mem_id);
		ovo.setOrder_idnumber(order_idnumber);
		order_service.insert(ovo);
		
		
		odvo.setOd_orderIdnumber(order_idnumber); 
		
		List<CartVO> clist =  (List<CartVO>)session.getAttribute("clist");
		String od_wineCode;
		int od_amount;
		for (int i = 0; i < clist.size(); i++) {
			od_wineCode = clist.get(i).getCart_wineCode();
			od_amount = clist.get(i).getCart_amount();
			
			odvo.setOd_wineCode(od_wineCode);
			odvo.setOd_amount(od_amount);
			
			order_service.insertDetails(odvo);
		}
		
		
		//카트 비우기
		order_service.delete(mem_id);
		
		return "redirect:/order/member_orderlist";
	}
	
	// 사용자 주문 내역
	@RequestMapping(value = "member_orderlist", method = RequestMethod.GET)
	public void memberlist(OrderVO ovo, HttpSession session, Model model) {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String mem_id = dto.getMem_id();
		
		List<OrderVO> olist = order_service.member_orderlist(mem_id);
		model.addAttribute("olist", olist);
	}
	
	// 사용자 주문내역 상세보기
	@RequestMapping(value = "read/{order_idnumber}")
	public String read(@PathVariable("order_idnumber") String order_idnumber, Model model) {
		List<OrderDetailsVO> odlist = order_service.read(order_idnumber);
		model.addAttribute("odlist", odlist);
		return "/order/member_detailorder";
	}
	
	// 관리자가 주문내역보기
	@RequestMapping(value = "admin_orderlist")
	public void admin_orderlist(Model model) {
		List<OrderVO> admin_olist = order_service.admin_orderlist();
		model.addAttribute("admin_olist", admin_olist);
	}
	
	
	// 주문취소요청하기(사용자)
	@RequestMapping(value = "cancel/{order_idnumber}")
	public String cacel(@PathVariable("order_idnumber") String order_idnumber) {
		order_service.cacel(order_idnumber);
		
		return "redirect:/order/member_orderlist";
	}
	

	
	// 배송하기
	@RequestMapping(value = "shipping/{order_idnumber}")
	public String shipping(@PathVariable("order_idnumber") String order_idnumber) {
		
		order_service.shipping(order_idnumber);
		
		// 재고 업데이트
		List<OrderDetailsVO> odlist = order_service.read(order_idnumber);
		String wine_code;
		int od_amount;
		
		for (int i = 0; i < odlist.size(); i++) {
			wine_code = odlist.get(i).getWine_code();
			od_amount = odlist.get(i).getOd_amount();
			OrderDetailsVO odvo = new OrderDetailsVO(0, null, null, od_amount, null, null, 0, wine_code);
			
			order_service.stockUpdate(odvo);
		}
		
		return "redirect:/order/admin_orderlist";
	}
	
	
	// 주문취소 승인하기(관리자)
	@RequestMapping(value = "cancelconfrim/{order_idnumber}")
	public String cancelconfrim(@PathVariable("order_idnumber") String order_idnumber) {
		
		order_service.shipping(order_idnumber);
		
		return "redirect:/order/admin_orderlist";
	}
	
	
	
}
