package ca.project.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ca.project.DTO.PageTO;
import ca.project.DTO.Q_boardVO;
import ca.project.Persistence.Q_boardDAO;

@Service
public class QNAServiceImpl implements QNAService{

	@Inject
	private Q_boardDAO qdao;
	
	@Override
	public PageTO list(PageTO qto) {
		int amount = qdao.getAmount();
		qto.setAmount(amount);
		List<Q_boardVO> qlist = qdao.list(qto);
		qto.setQlist(qlist);
		return qto;
	}

	@Override
	public void insert(Q_boardVO qvo) {
		qdao.insert(qvo);
		qdao.rootUpdate(qvo.getqb_no());
	}

	@Override
	public Q_boardVO read(int qb_no) {
		Q_boardVO qvo = qdao.read(qb_no);
		qdao.cntUpdate(qb_no);
		return qvo;
	}

	@Override
	public Q_boardVO updateui(int qb_no) {
		Q_boardVO qvo = qdao.read(qb_no);
		return qvo;
	}

	@Override
	public void update(Q_boardVO qvo) {
		qdao.update(qvo);
	}

	@Override
	public void delete(int qb_no) {
		qdao.delete(qb_no);
	}

	@Override
	public Q_boardVO replyui(int qb_no) {
		Q_boardVO qvo = qdao.read(qb_no);
		return qvo;
	}

	@Override
	public void reply(Q_boardVO qvo, int parent_qb_root, int parent_qb_step, int parent_qb_indent) {
		qdao.stepUpdate(parent_qb_root, parent_qb_step);
		qdao.insert(qvo);
		qdao.replyUpdate(qvo.getqb_no(), parent_qb_root, parent_qb_step, parent_qb_indent);
	}


}
