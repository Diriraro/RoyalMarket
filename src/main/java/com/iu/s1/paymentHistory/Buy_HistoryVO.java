package com.iu.s1.paymentHistory;

public class Buy_HistoryVO {
	
	private String mem_id;
	private long sell_num;
	private long sell_price;
	private long status;
	private String sell_product;
	private String file_name;
	private String seller_id;
	private String buy_date;
	
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
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
