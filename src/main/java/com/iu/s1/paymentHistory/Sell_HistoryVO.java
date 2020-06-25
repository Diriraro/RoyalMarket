package com.iu.s1.paymentHistory;

public class Sell_HistoryVO {
	
	private String mem_id;
	private long sell_num;
	private long sell_price;
	private long status;
	private String sell_product;
	
	public String getSell_product() {
		return sell_product;
	}
	public void setSell_product(String sell_product) {
		this.sell_product = sell_product;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public long getSell_num() {
		return sell_num;
	}
	public void setSell_num(long sell_num) {
		this.sell_num = sell_num;
	}
	public long getSell_price() {
		return sell_price;
	}
	public void setSell_price(long sell_price) {
		this.sell_price = sell_price;
	}
	public long getStatus() {
		return status;
	}
	public void setStatus(long status) {
		this.status = status;
	}
	
	

}
