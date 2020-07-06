package com.iu.s1.paymentHistory;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentHistoryRepository{
	
	public Long getDailyTradeCount(Date sell_date)throws Exception;
	public long getLocateTradeCount(String seller_address) throws Exception;
	public Long getProfit(String sell_date1, String sell_date2) throws Exception;
	public Long getRateForTradeCountYD(String sell_date1, String sell_date2) throws Exception;

}
