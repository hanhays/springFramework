package ca.project.Persistence;

import java.util.List;

import ca.project.DTO.PageTO;
import ca.project.DTO.WineDTO;

public interface WineDAO {
	
	// 상품등록
	void insert(WineDTO wdto);

	// 상품 목록
	int getAmount();
	List<WineDTO> getListpage(PageTO to);
	// select list
	int getSelectAmount(String wine_type);
	List<WineDTO> getSelectListpage(PageTO to, String wine_type);

	int getSearchAmount(String content);
	List<WineDTO> search(PageTO to, String content);
	
	// 상품정보 자세히 보기
	WineDTO read(String wine_code);
	void updateWine_readcnt(String wine_code);	// 조회수 증가
	
	// 상품정보 수정하기
	void update(WineDTO wdto);
	
	// 상품 삭제
	void delete(String wine_code);



	
	
}
