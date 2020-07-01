package com.iu.s1.payment;

import java.sql.Date;

public class PayStatsVO {

	private long paystatsnum;
	private Date sell_date;
	private String seller_address;
	private long sell_commition;
	public long getPaystatsnum() {
		return paystatsnum;
	}
	public void setPaystatsnum(long paystatsnum) {
		this.paystatsnum = paystatsnum;
	}
	public Date getSell_date() {
		return sell_date;
	}
	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}
	public String getSeller_address() {
		return seller_address;
	}
	public void setSeller_address(String seller_address) {
		this.seller_address = seller_address;
	}
	public long getSell_commition() {
		return sell_commition;
	}
	public void setSell_commition(long sell_commition) {
		this.sell_commition = sell_commition;
	}
	
}
