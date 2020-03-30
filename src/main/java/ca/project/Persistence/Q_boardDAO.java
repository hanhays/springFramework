package ca.project.Persistence;

import java.util.List;

import ca.project.DTO.PageTO;
import ca.project.DTO.Q_boardVO;

public interface Q_boardDAO {

	int getAmount();
	
	List<Q_boardVO> list(PageTO qto);
	
	void insert(Q_boardVO qvo);
	
	void rootUpdate(int qb_no);

	Q_boardVO read(int qb_no);
	
	void cntUpdate(int qb_no);

	void update(Q_boardVO qvo);

	void delete(int qb_no);

	void replyUpdate(int qb_no, int parent_qb_root, int parent_qb_step, int parent_qb_indent);
	
	void stepUpdate(int parent_qb_root, int parent_qb_step);

}
