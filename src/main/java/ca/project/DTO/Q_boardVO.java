package ca.project.DTO;

import java.io.Serializable;

public class Q_boardVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int qb_no;
	private String qb_writer;
	private String qb_title;
	private String qb_content;
	private String qb_regdate;
	private String qb_updatedate;
	private int qb_readcnt;
	private int qb_root;
	private int qb_step;
	private int qb_indent;
	
	public Q_boardVO() {
		// TODO Auto-generated constructor stub
	}

	public Q_boardVO(int qb_no, String qb_writer, String qb_title, String qb_content, String qb_regdate,
			String qb_updatedate, int qb_readcnt, int qb_root, int qb_step, int qb_indent) {
		super();
		this.qb_no = qb_no;
		this.qb_writer = qb_writer;
		this.qb_title = qb_title;
		this.qb_content = qb_content;
		this.qb_regdate = qb_regdate;
		this.qb_updatedate = qb_updatedate;
		this.qb_readcnt = qb_readcnt;
		this.qb_root = qb_root;
		this.qb_step = qb_step;
		this.qb_indent = qb_indent;
	}

	public int getqb_no() {
		return qb_no;
	}

	public void setqb_no(int qb_no) {
		this.qb_no = qb_no;
	}

	public String getqb_writer() {
		return qb_writer;
	}

	public void setqb_writer(String qb_writer) {
		this.qb_writer = qb_writer;
	}

	public String getqb_title() {
		return qb_title;
	}

	public void setqb_title(String qb_title) {
		this.qb_title = qb_title;
	}

	public String getqb_content() {
		return qb_content;
	}

	public void setqb_content(String qb_content) {
		this.qb_content = qb_content;
	}

	public String getqb_regdate() {
		return qb_regdate;
	}

	public void setqb_regdate(String qb_regdate) {
		this.qb_regdate = qb_regdate;
	}

	public String getqb_updatedate() {
		return qb_updatedate;
	}

	public void setqb_updatedate(String qb_updatedate) {
		this.qb_updatedate = qb_updatedate;
	}

	public int getqb_readcnt() {
		return qb_readcnt;
	}

	public void setqb_readcnt(int qb_readcnt) {
		this.qb_readcnt = qb_readcnt;
	}

	public int getqb_root() {
		return qb_root;
	}

	public void setqb_root(int qb_root) {
		this.qb_root = qb_root;
	}
	
	public int getQb_step() {
		return qb_step;
	}

	public void setQb_step(int qb_step) {
		this.qb_step = qb_step;
	}

	public int getqb_indent() {
		return qb_indent;
	}

	public void setqb_indent(int qb_indent) {
		this.qb_indent = qb_indent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Q_boardVO [qb_no=" + qb_no + ", qb_writer=" + qb_writer + ", qb_title=" + qb_title + ", qb_regdate="
				+ qb_regdate + ", qb_updatedate=" + qb_updatedate + ", qb_readcnt=" + qb_readcnt + ", qb_root="
				+ qb_root + ", qb_step=" + qb_step + ", qb_indent=" + qb_indent + "]";
	}

}
