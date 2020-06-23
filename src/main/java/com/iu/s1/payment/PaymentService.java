package com.iu.s1.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;
import com.iu.s1.paymentHistory.Buy_HistoryVO;
import com.iu.s1.paymentHistory.Sell_HistoryVO;
import com.iu.s1.trading.TradingVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return paymentMapper.pointUpdate(memberVO);
	}
	
	public long pointSelect(String mem_id)throws Exception{
		return paymentMapper.pointSelect(mem_id);
	}
	
	
	public int paymentCharge(PayVO payVO)throws Exception{
		return paymentMapper.paymentCharge(payVO);
	}
	public int paymentOut(PayVO payVO)throws Exception{
		return paymentMapper.paymentOut(payVO);
	}
	
	public List<PayVO> pointManage(String mem_id)throws Exception{
		return paymentMapper.pointManage(mem_id);
	}
	
	public int tradingInsert(TradingVO tradingVO)throws Exception{
		return paymentMapper.tradingInsert(tradingVO);
	}
	
	public String seller_id_select(long sell_num)throws Exception{
		return paymentMapper.seller_id_select(sell_num);
	}
	
	public int buy_his(Buy_HistoryVO buy_HistoryVO)throws Exception{
		return paymentMapper.buy_his(buy_HistoryVO);
	}
	
	public int sell_his(Sell_HistoryVO sell_HistoryVO)throws Exception{
		return paymentMapper.sell_his(sell_HistoryVO);
	}
	
	public List<Buy_HistoryVO> buy_hisSelect(String mem_id)throws Exception{
		return paymentMapper.buy_hisSelect(mem_id);
	}
	
	public List<Sell_HistoryVO> sell_hisSelect(String mem_id)throws Exception{
		return paymentMapper.sell_hisSelect(mem_id);
	}
	
	public int tradingReceiveUp(long receive)throws Exception{
		return paymentMapper.tradingReceiveUp(receive);
	}
	
	public int buy_statusUp(long status)throws Exception{
		return paymentMapper.buy_statusUp(status);
	}
	
	public int tradingGiveUp(long give)throws Exception{
		return paymentMapper.tradingGiveUp(give);
	}
	
	public int sell_statusUp(long status)throws Exception{
		return paymentMapper.sell_statusUp(status);
	}
	
	public TradingVO trandingSelect(long sell_num)throws Exception{
		return paymentMapper.tradingSelect(sell_num);
	}
	public int tradingDelete(long sell_num)throws Exception{
		return paymentMapper.tradingDelete(sell_num);
	}
	
}
