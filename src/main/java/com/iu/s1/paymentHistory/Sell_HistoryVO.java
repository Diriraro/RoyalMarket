package com.iu.s1.paymentHistory;

public class Sell_HistoryVO {
	
	private String mem_id;
	private long sell_num;
	private long sell_price;
	private long status;
	private String sell_product;
	private String file_name;
	private String buyer_id;
	private String sell_date;
	private long sell_history_num;
	private int sell_check;
	
	public int getSell_check() {
		return sell_check;
	}
	public void setSell_check(int sell_check) {
		this.sell_check = sell_check;
	}
	public long getSell_history_num() {
		return sell_history_num;
	}
	public void setSell_history_num(long sell_history_num) {
		this.sell_history_num = sell_history_num;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
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
