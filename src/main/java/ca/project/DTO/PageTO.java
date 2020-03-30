package ca.project.DTO;

import java.util.List;


public class PageTO {
	private int curPage = 1;
	private int amount;
	private int perPage = 9;
	private int totalPage;
	private int startNum;
	private int endNum;
	private int pageLine = 10;
	private int beginPageNum;
	private int stopPageNum;
	
	private List<MemberDTO> list;
	private List<R_boardVO> rlist;
	private List<WineDTO> wlist;
	private List<Q_boardVO> qlist;

	
	private void process() {
		totalPage = (amount-1)/perPage + 1;
		startNum = (curPage-1)*perPage + 1;
		endNum = curPage * 10;
		if(endNum > amount){
			endNum = amount;
		}
		beginPageNum = ((curPage -1)/pageLine)*pageLine + 1;
		stopPageNum = beginPageNum + (pageLine - 1);
		if(stopPageNum > totalPage){
			stopPageNum = totalPage;
		}
	}
	
	public PageTO() {
		process();
	}
	
	public PageTO(int curPage) {
		this.curPage = curPage;
		process();
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		process();
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		process();
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
		process();
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getPageLine() {
		return pageLine;
	}

	public void setPageLine(int pageLine) {
		this.pageLine = pageLine;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}

	public List<MemberDTO> getList() {
		return list;
	}

	public void setList(List<MemberDTO> list) {
		this.list = list;
	}

	public List<R_boardVO> getRlist() {
		return rlist;
	}

	public void setRlist(List<R_boardVO> rlist) {
		this.rlist = rlist;
	}

	public List<WineDTO> getWlist() {
		return wlist;
	}

	public void setWlist(List<WineDTO> wlist) {
		this.wlist = wlist;
	}

	public List<Q_boardVO> getQlist() {
		return qlist;
	}

	public void setQlist(List<Q_boardVO> qlist) {
		this.qlist = qlist;
		process();
	}	
	
	
	
	

	
	
	
}
