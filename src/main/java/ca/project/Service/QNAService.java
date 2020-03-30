package ca.project.Service;

import ca.project.DTO.PageTO;
import ca.project.DTO.Q_boardVO;

public interface QNAService {
	
	PageTO list(PageTO qto);
	
	void insert(Q_boardVO qvo);
	
	Q_boardVO read(int qb_no);
	
	Q_boardVO updateui(int qb_no);
	
	void update(Q_boardVO qvo);
	
	void delete(int qb_no);

	void reply(Q_boardVO qvo, int parent_qb_root, int parent_qb_step, int parent_qb_indent);

	Q_boardVO replyui(int qb_no);
	

}
