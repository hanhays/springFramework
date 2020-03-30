package ca.project.DTO;

import java.io.Serializable;

public class OrderDetailsVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int od_no;
	private String od_orderIdnumber;
	private String od_wineCode;
	private int od_amount;
	
	private String wine_name;
	private String wine_thumbimg;
	private int wine_price;
	private String wine_code;
	
	public OrderDetailsVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetailsVO(int od_no, String od_orderIdnumber, String od_wineCode, int od_amount, String wine_name,
			String wine_thumbimg, int wine_price, String wine_code) {
		super();
		this.od_no = od_no;
		this.od_orderIdnumber = od_orderIdnumber;
		this.od_wineCode = od_wineCode;
		this.od_amount = od_amount;
		this.wine_name = wine_name;
		this.wine_thumbimg = wine_thumbimg;
		this.wine_price = wine_price;
		this.wine_code = wine_code;
	}

	public int getOd_no() {
		return od_no;
	}

	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}

	public String getOd_orderIdnumber() {
		return od_orderIdnumber;
	}

	public void setOd_orderIdnumber(String od_orderIdnumber) {
		this.od_orderIdnumber = od_orderIdnumber;
	}

	public String getOd_wineCode() {
		return od_wineCode;
	}

	public void setOd_wineCode(String od_wineCode) {
		this.od_wineCode = od_wineCode;
	}

	public int getOd_amount() {
		return od_amount;
	}

	public void setOd_amount(int od_amount) {
		this.od_amount = od_amount;
	}

	public String getWine_name() {
		return wine_name;
	}

	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}

	public String getWine_thumbimg() {
		return wine_thumbimg;
	}

	public void setWine_thumbimg(String wine_thumbimg) {
		this.wine_thumbimg = wine_thumbimg;
	}

	public int getWine_price() {
		return wine_price;
	}

	public void setWine_price(int wine_price) {
		this.wine_price = wine_price;
	}

	public String getWine_code() {
		return wine_code;
	}

	public void setWine_code(String wine_code) {
		this.wine_code = wine_code;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	
	
}
