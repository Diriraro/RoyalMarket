package com.iu.s1.payment;

public class PayVO {
	
	private long pay_num;
	private long pay_price;
	private long pay_in;
	private long pay_out;
	private String member_id;
	
	
	public long getPay_num() {
		return pay_num;
	}
	public void setPay_num(long pay_num) {
		this.pay_num = pay_num;
	}
	public long getPay_price() {
		return pay_price;
	}
	public void setPay_price(long pay_price) {
		this.pay_price = pay_price;
	}
	public long getPay_in() {
		return pay_in;
	}
	public void setPay_in(long pay_in) {
		this.pay_in = pay_in;
	}
	public long getPay_out() {
		return pay_out;
	}
	public void setPay_out(long pay_out) {
		this.pay_out = pay_out;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	

}
