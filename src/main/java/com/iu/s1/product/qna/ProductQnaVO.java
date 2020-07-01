package com.iu.s1.product.qna;

import java.sql.Date;

import lombok.Data;

public class ProductQnaVO {
	
	private long pq_num;
	
	private long sell_num;
	
	private long pq_storeNum;
	
	private String pq_contents;
	
	private Date pq_regDate;
	
	private String pq_storeName;

	public String getPq_storeName() {
		return pq_storeName;
	}

	public void setPq_storeName(String pq_storeName) {
		this.pq_storeName = pq_storeName;
	}

	public long getPq_num() {
		return pq_num;
	}

	public void setPq_num(long pq_num) {
		this.pq_num = pq_num;
	}

	public long getSell_num() {
		return sell_num;
	}

	public void setSell_num(long sell_num) {
		this.sell_num = sell_num;
	}

	public long getPq_storeNum() {
		return pq_storeNum;
	}

	public void setPq_storeNum(long pq_storeNum) {
		this.pq_storeNum = pq_storeNum;
	}

	public String getPq_contents() {
		return pq_contents;
	}

	public void setPq_contents(String pq_contents) {
		this.pq_contents = pq_contents;
	}

	public Date getPq_regDate() {
		return pq_regDate;
	}

	public void setPq_regDate(Date pq_regDate) {
		this.pq_regDate = pq_regDate;
	}



}
