package ca.project.DTO;

import java.io.Serializable;

public class WineDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String wine_code;
	private String wine_name;
	private String wine_img;
	private String wine_thumbimg;
	private String wine_type;
	private int wine_price;
	private int wine_stock;
	private String wine_regdate;
	private String wine_info;
	private int wine_readcnt;
	
	public WineDTO() {
		// TODO Auto-generated constructor stub
	}

	public WineDTO(String wine_code, String wine_name, String wine_img, String wine_thumbimg, String wine_type,
			int wine_price, int wine_stock, String wine_regdate, String wine_info, int wine_readcnt) {
		super();
		this.wine_code = wine_code;
		this.wine_name = wine_name;
		this.wine_img = wine_img;
		this.wine_thumbimg = wine_thumbimg;
		this.wine_type = wine_type;
		this.wine_price = wine_price;
		this.wine_stock = wine_stock;
		this.wine_regdate = wine_regdate;
		this.wine_info = wine_info;
		this.wine_readcnt = wine_readcnt;
	}

	public String getWine_code() {
		return wine_code;
	}

	public void setWine_code(String wine_code) {
		this.wine_code = wine_code;
	}

	public String getWine_name() {
		return wine_name;
	}

	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}

	public String getWine_img() {
		return wine_img;
	}

	public void setWine_img(String wine_img) {
		this.wine_img = wine_img;
	}

	public String getWine_thumbimg() {
		return wine_thumbimg;
	}

	public void setWine_thumbimg(String wine_thumbimg) {
		this.wine_thumbimg = wine_thumbimg;
	}

	public String getWine_type() {
		return wine_type;
	}

	public void setWine_type(String wine_type) {
		this.wine_type = wine_type;
	}

	public int getWine_price() {
		return wine_price;
	}

	public void setWine_price(int wine_price) {
		this.wine_price = wine_price;
	}

	public int getWine_stock() {
		return wine_stock;
	}

	public void setWine_stock(int wine_stock) {
		this.wine_stock = wine_stock;
	}

	public String getWine_regdate() {
		return wine_regdate;
	}

	public void setWine_regdate(String wine_regdate) {
		this.wine_regdate = wine_regdate;
	}

	public String getWine_info() {
		return wine_info;
	}

	public void setWine_info(String wine_info) {
		this.wine_info = wine_info;
	}

	public int getWine_readcnt() {
		return wine_readcnt;
	}

	public void setWine_readcnt(int wine_readcnt) {
		this.wine_readcnt = wine_readcnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	


}
