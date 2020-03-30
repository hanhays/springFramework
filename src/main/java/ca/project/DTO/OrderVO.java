package ca.project.DTO;

import java.io.Serializable;

public class OrderVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String order_idnumber;
	private int order_no;
	private Double order_totalprice;
	private String order_regdate;
	private String order_memId;
	private int order_state;
	private int order_cancel;
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderVO(String order_idnumber, int order_no, Double order_totalprice, String order_regdate,
			String order_memId, int order_state, int order_cancel) {
		super();
		this.order_idnumber = order_idnumber;
		this.order_no = order_no;
		this.order_totalprice = order_totalprice;
		this.order_regdate = order_regdate;
		this.order_memId = order_memId;
		this.order_state = order_state;
		this.order_cancel = order_cancel;
	}

	public String getOrder_idnumber() {
		return order_idnumber;
	}

	public void setOrder_idnumber(String order_idnumber) {
		this.order_idnumber = order_idnumber;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public Double getOrder_totalprice() {
		return order_totalprice;
	}

	public void setOrder_totalprice(Double order_totalprice) {
		this.order_totalprice = order_totalprice;
	}

	public String getOrder_regdate() {
		return order_regdate;
	}

	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}

	public String getOrder_memId() {
		return order_memId;
	}

	public void setOrder_memId(String order_memId) {
		this.order_memId = order_memId;
	}

	public int getOrder_state() {
		return order_state;
	}

	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}

	public int getOrder_cancel() {
		return order_cancel;
	}

	public void setOrder_cancel(int order_cancel) {
		this.order_cancel = order_cancel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
