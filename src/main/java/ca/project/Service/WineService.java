package ca.project.Service;

import ca.project.DTO.PageTO;
import ca.project.DTO.WineDTO;

public interface WineService {
	
	// 상품등록
	void insert(WineDTO wdto);
	
	// 상품 목록
	PageTO list(PageTO to);
	
	PageTO search(PageTO to, String content);
	
	// select list
	PageTO selectList(PageTO to, String wine_type);
	
	// 상품정보 자세히 보기
	WineDTO read(String wine_code);
	
	// 상품정보 수정하기
	void update(WineDTO wdto);
	
	// 상품 삭제
	void delete(String wine_code);

	

}
