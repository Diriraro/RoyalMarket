package com.iu.s1.trading;

public class TradingVO {
	private long trading_num;
	private long sell_num;
	private long sell_price;
	private String buyer_id;
	private String seller_id;
	private long receive;
	private long give;
	
	
	public long getTrading_num() {
		return trading_num;
	}
	public void setTrading_num(long trading_num) {
		this.trading_num = trading_num;
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
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public long getReceive() {
		return receive;
	}
	public void setReceive(long receive) {
		this.receive = receive;
	}
	public long getGive() {
		return give;
	}
	public void setGive(long give) {
		this.give = give;
	}
	

}
