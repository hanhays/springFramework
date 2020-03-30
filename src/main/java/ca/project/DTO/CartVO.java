package ca.project.DTO;

import java.io.Serializable;

public class CartVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cart_no;
	private String cart_memId;
	private String cart_wineCode;
	private int cart_amount;
	private String cart_regdate;
		
	private String wine_name;
	private String wine_thumbimg;
	private String wine_price;
	private String wine_stock;

	public CartVO() {
		// TODO Auto-generated constructor stub
	}

	public CartVO(int cart_no, String cart_memId, String cart_wineCode, int cart_amount, String cart_regdate,
			String wine_name, String wine_thumbimg, String wine_price, String wine_stock) {
		super();
		this.cart_no = cart_no;
		this.cart_memId = cart_memId;
		this.cart_wineCode = cart_wineCode;
		this.cart_amount = cart_amount;
		this.cart_regdate = cart_regdate;
		this.wine_name = wine_name;
		this.wine_thumbimg = wine_thumbimg;
		this.wine_price = wine_price;
		this.wine_stock = wine_stock;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getCart_memId() {
		return cart_memId;
	}

	public void setCart_memId(String cart_memId) {
		this.cart_memId = cart_memId;
	}

	public String getCart_wineCode() {
		return cart_wineCode;
	}

	public void setCart_wineCode(String cart_wineCode) {
		this.cart_wineCode = cart_wineCode;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public String getCart_regdate() {
		return cart_regdate;
	}

	public void setCart_regdate(String cart_regdate) {
		this.cart_regdate = cart_regdate;
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

	public String getWine_price() {
		return wine_price;
	}

	public void setWine_price(String wine_price) {
		this.wine_price = wine_price;
	}

	public String getWine_stock() {
		return wine_stock;
	}

	public void setWine_stock(String wine_stock) {
		this.wine_stock = wine_stock;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
