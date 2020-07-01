package com.iu.s1.product;

import java.sql.Date;

public class ProductVO {
	
	private Long sell_num;
	
	private int mem_storeNum;
	
	private String sell_product;
	
	private int sell_price;
	
	private String sell_info;
	
	private String sell_kind;
	
	private String sell_tag;
	
	private Date sell_date;
	
	private Long sell_status;
	
	private Long sell_hit;
	
	private String mem_address;

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public Long getSell_status() {
		return sell_status;
	}

	public void setSell_status(Long sell_status) {
		this.sell_status = sell_status;
	}

	public Long getSell_hit() {
		return sell_hit;
	}

	public void setSell_hit(Long sell_hit) {
		this.sell_hit = sell_hit;
	}

	public Long getSell_num() {
		return sell_num;
	}

	public void setSell_num(Long sell_num) {
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
