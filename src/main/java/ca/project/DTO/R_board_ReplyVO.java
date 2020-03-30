package ca.project.DTO;

import java.io.Serializable;

public class R_board_ReplyVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rpy_no;
	private int rpy_bno;
	private String rpy_writer;
	private String rpy_content;
	private String rpy_regdate;
	
	public R_board_ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public R_board_ReplyVO(int rpy_no, int rpy_bno, String rpy_writer, String rpy_content, String rpy_regdate) {
		super();
		this.rpy_no = rpy_no;
		this.rpy_bno = rpy_bno;
		this.rpy_writer = rpy_writer;
		this.rpy_content = rpy_content;
		this.rpy_regdate = rpy_regdate;
	}

	public int getRpy_no() {
		return rpy_no;
	}

	public void setRpy_no(int rpy_no) {
		this.rpy_no = rpy_no;
	}

	public int getRpy_bno() {
		return rpy_bno;
	}

	public void setRpy_bno(int rpy_bno) {
		this.rpy_bno = rpy_bno;
	}

	public String getRpy_writer() {
		return rpy_writer;
	}

	public void setRpy_writer(String rpy_writer) {
		this.rpy_writer = rpy_writer;
	}

	public String getRpy_content() {
		return rpy_content;
	}

	public void setRpy_content(String rpy_content) {
		this.rpy_content = rpy_content;
	}

	public String getRpy_regdate() {
		return rpy_regdate;
	}

	public void setRpy_regdate(String rpy_regdate) {
		this.rpy_regdate = rpy_regdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rpy_no;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		R_board_ReplyVO other = (R_board_ReplyVO) obj;
		if (rpy_no != other.rpy_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "R_board_ReplyVO [rpy_no=" + rpy_no + ", rpy_writer=" + rpy_writer + "]";
	}
	

}
