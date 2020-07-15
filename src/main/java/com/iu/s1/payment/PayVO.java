package com.iu.s1.payment;

public class PayVO {
	
	private long pay_num;
	private long pay_price;
	private long pay_in;
	private long pay_out;
	private String mem_id;
	private long point_rest;
	private long pay_cash;
	
	
	public long getPay_cash() {
		return pay_cash;
	}
	public void setPay_cash(long pay_cash) {
		this.pay_cash = pay_cash;
	}
	public long getPoint_rest() {
		return point_rest;
	}
	public void setPoint_rest(long point_rest) {
		this.point_rest = point_rest;
	}
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


}
