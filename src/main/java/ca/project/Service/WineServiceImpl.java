package ca.project.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ca.project.DTO.PageTO;
import ca.project.DTO.WineDTO;
import ca.project.Persistence.WineDAO;

@Service
public class WineServiceImpl implements WineService{
	
	@Autowired
	private WineDAO wine_dao;
	
	// 상품등록
	@Override
	public void insert(WineDTO wdto) {
		wine_dao.insert(wdto);
	}
	
	// 상품 목록
	@Override
	public PageTO list(PageTO to) {
		int amount = wine_dao.getAmount();
		to.setAmount(amount);
		List<WineDTO> wlist = wine_dao.getListpage(to);
		to.setWlist(wlist);
		return to;
	}
	
	@Override
	public PageTO search(PageTO to, String content) {
		int amount = wine_dao.getSearchAmount(content);
		to.setAmount(amount);
		List<WineDTO> wlist = wine_dao.search(to, content);
		to.setWlist(wlist);
		return to;
	}
	
	
	// select list
	@Override
	public PageTO selectList(PageTO to, String wine_type) {
		int amount = wine_dao.getSelectAmount(wine_type);
		to.setAmount(amount);
		List<WineDTO> wlist = wine_dao.getSelectListpage(to, wine_type);
		to.setWlist(wlist);
		return to;
	}
	
	// 상품정보 자세히 보기
	@Override
	public WineDTO read(String wine_code) {
		wine_dao.updateWine_readcnt(wine_code);	// 조회수 증가
		return wine_dao.read(wine_code);
	}
	
	// 상품정보 수정하기
	@Override
	public void update(WineDTO wdto) {
		wine_dao.update(wdto);
	}
	
	// 상품 삭제
	@Override
	public void delete(String wine_code) {
		wine_dao.delete(wine_code);
	}


	
}
