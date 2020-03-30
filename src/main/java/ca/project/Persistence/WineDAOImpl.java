package ca.project.Persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import ca.project.DTO.PageTO;
import ca.project.DTO.WineDTO;

@Repository
public class WineDAOImpl implements WineDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NS = "ca.project.Wine";
	
	// 상품등록
	@Override
	public void insert(WineDTO wdto) {
		session.insert(NS + ".insert", wdto);
	}
	
	// 상품 목록
	@Override
	public int getAmount() {
		return session.selectOne(NS + ".getAmount");
	}
	@Override
	public List<WineDTO> getListpage(PageTO to) {
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS + ".getListpage", null, rb);
	}
	// select list
	@Override
	public int getSelectAmount(String wine_type) {
		return session.selectOne(NS + ".getSelectAmount", wine_type);
	}
	@Override
	public List<WineDTO> getSelectListpage(PageTO to, String wine_type) {
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS + ".getSelectListpage", wine_type, rb);
	}

	@Override
	public int getSearchAmount(String content) {
		return session.selectOne(NS+".getSearchAmount", content);
	}

	@Override
	public List<WineDTO> search(PageTO to, String content) {
		RowBounds rowBound = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS+".search", content, rowBound);
	}
	
	// 상품정보 자세히 보기
	@Override
	public WineDTO read(String wine_code) {
		return session.selectOne(NS + ".read", wine_code);
	}
	// 조회수 증가
	@Override
	public void updateWine_readcnt(String wine_code) {
		session.update(NS + ".updateWine_readcnt", wine_code);
	}
	
	// 상품정보 수정하기
	@Override
	public void update(WineDTO wdto) {
		session.update(NS + ".update", wdto);
	}
	
	// 상품 삭제
	@Override
	public void delete(String wine_code) {
		session.delete(NS + ".delete", wine_code);	
	}



}
