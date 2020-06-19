package com.iu.s1.product;

import java.sql.Date;

public class ProductVO {
	
	private int sell_num;
	
	private int mem_storeNum;
	
	private String sell_product;
	
	private int sell_price;
	
	private String sell_info;
	
	private String sell_kind;
	
	private String sell_tag;
	
	private Date sell_date;
	

	public int getSell_num() {
		return sell_num;
	}

	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}

	public int getMem_storeNum() {
		return mem_storeNum;
	}

	public void setMem_storeNum(int mem_storeNum) {
		this.mem_storeNum = mem_storeNum;
	}

	public String getSell_product() {
		return sell_product;
	}

	public void setSell_product(String sell_product) {
		this.sell_product = sell_product;
	}

	public int getSell_price() {
		return sell_price;
	}

	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}

	public String getSell_info() {
		return sell_info;
	}

	public void setSell_info(String sell_info) {
		this.sell_info = sell_info;
	}

	public String getSell_kind() {
		return sell_kind;
	}

	public void setSell_kind(String sell_kind) {
		this.sell_kind = sell_kind;
	}

	public String getSell_tag() {
		return sell_tag;
	}

	public void setSell_tag(String sell_tag) {
		this.sell_tag = sell_tag;
	}

	public Date getSell_date() {
		return sell_date;
	}

	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}


	
}
