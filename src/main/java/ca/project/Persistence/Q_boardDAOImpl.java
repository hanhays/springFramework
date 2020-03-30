package ca.project.Persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ca.project.DTO.PageTO;
import ca.project.DTO.Q_boardVO;

@Repository
public class Q_boardDAOImpl implements Q_boardDAO{

	@Inject
	private SqlSession session;
	private final String NS = "ca.project.Q_board";
	

	@Override
	public int getAmount() {
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<Q_boardVO> list(PageTO qto) {
		RowBounds rowBounds = new RowBounds(qto.getStartNum()-1, qto.getPerPage());
		return session.selectList(NS+".list", null, rowBounds);
	}

	@Override
	public void insert(Q_boardVO qvo) {
		session.insert(NS+".insert", qvo);
	}

	@Override
	public Q_boardVO read(int qb_no) {
		return session.selectOne(NS+".read", qb_no);
	}

	@Override
	public void cntUpdate(int qb_no) {
		session.update(NS+".cntUpdate", qb_no);
	}

	@Override
	public void update(Q_boardVO qvo) {
		session.update(NS+".update", qvo);
	}

	@Override
	public void delete(int qb_no) {
		session.delete(NS+".delete", qb_no);
	}

	@Override
	public void rootUpdate(int qb_no) {
		session.update(NS+".rootUpdate", qb_no);
	}

	@Override
	public void replyUpdate(int qb_no, int parent_qb_root, int parent_qb_step, int parent_qb_indent) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("qb_no", qb_no);
		map.put("parent_qb_root", parent_qb_root);
		map.put("parent_qb_step", parent_qb_step);
		map.put("parent_qb_indent", parent_qb_indent);
		session.update(NS+".replyUpdate", map);
	}

	@Override
	public void stepUpdate(int parent_qb_root, int parent_qb_step) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("parent_qb_root", parent_qb_root);
		map.put("parent_qb_step", parent_qb_step);
		session.update(NS+".stepUpdate", map);
	}

}
