package ca.project.Controller;

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
import ca.project.Service.CartService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cart_service;
	
	// 장바구니 담기
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(CartVO cvo,  HttpSession session) {
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		if (login != null) {
			cvo.setCart_memId(login.getMem_id());
			cart_service.insert(cvo);
			return "redirect:/cart/list";
		}
		
		return "redirect:/member/loginui";
	}
	
	// 장바구니 목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		if (login != null) {
			String mem_id = login.getMem_id();
			List<CartVO> clist = cart_service.list(mem_id);
			session.setAttribute("clist", clist);
			return "/cart/cart_list";
		}
		
		return "redirect:/member/loginui";
	}
	
	
	// 장바구니 삭제
	@RequestMapping(value = "delete/{cart_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("cart_no") int cart_no) {
		cart_service.delete(cart_no);
		return "redirect:/cart/list";
	}
}
