package ca.project.DTO;

import java.io.Serializable;

public class R_boardVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rb_no;
	private String rb_writer;
	private String rb_title;
	private String rb_content;
	private String rb_regdate;
	private int rb_readcnt;
	private String rb_wineCode;
	
	private String wine_code;
	private String wine_name;
	private String wine_img;
	private String wine_thumbimg;
	private String wine_type;
	private int wine_price;
	
	public R_boardVO() {
		// TODO Auto-generated constructor stub
	}

	public R_boardVO(int rb_no, String rb_writer, String rb_title, String rb_content, String rb_regdate, int rb_readcnt,
			String rb_wineCode, String wine_code, String wine_name, String wine_img, String wine_thumbimg,
			String wine_type, int wine_price) {
		super();
		this.rb_no = rb_no;
		this.rb_writer = rb_writer;
		this.rb_title = rb_title;
		this.rb_content = rb_content;
		this.rb_regdate = rb_regdate;
		this.rb_readcnt = rb_readcnt;
		this.rb_wineCode = rb_wineCode;
		this.wine_code = wine_code;
		this.wine_name = wine_name;
		this.wine_img = wine_img;
		this.wine_thumbimg = wine_thumbimg;
		this.wine_type = wine_type;
		this.wine_price = wine_price;
	}

	public int getRb_no() {
		return rb_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public String getRb_writer() {
		return rb_writer;
	}

	public void setRb_writer(String rb_writer) {
		this.rb_writer = rb_writer;
	}

	public String getRb_title() {
		return rb_title;
	}

	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}

	public String getRb_content() {
		return rb_content;
	}

	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}

	public String getRb_regdate() {
		return rb_regdate;
	}

	public void setRb_regdate(String rb_regdate) {
		this.rb_regdate = rb_regdate;
	}

	public int getRb_readcnt() {
		return rb_readcnt;
	}

	public void setRb_readcnt(int rb_readcnt) {
		this.rb_readcnt = rb_readcnt;
	}

	public String getRb_wineCode() {
		return rb_wineCode;
	}

	public void setRb_wineCode(String rb_wineCode) {
		this.rb_wineCode = rb_wineCode;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rb_no;
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
		R_boardVO other = (R_boardVO) obj;
		if (rb_no != other.rb_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "R_boardVO [rb_no=" + rb_no + ", rb_writer=" + rb_writer + "]";
	}
	
	
	
	
}
