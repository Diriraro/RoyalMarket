package com.iu.s1.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.s1.member.MemberVO;
import com.iu.s1.paycheck.PayCheckVO;
import com.iu.s1.paymentHistory.Buy_HistoryVO;
import com.iu.s1.paymentHistory.Sell_HistoryVO;
import com.iu.s1.product.ProductVO;
import com.iu.s1.saveCash.SaveCashRepository;
import com.iu.s1.saveCash.SaveCashVO;
import com.iu.s1.trading.TradingVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	@Autowired
	private SaveCashRepository saveCashRepository;		//적립금
	
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return paymentMapper.pointUpdate(memberVO);
	}
	
	public long pointSelect(String mem_id)throws Exception{
		return paymentMapper.pointSelect(mem_id);
	}
	
	public ProductVO productSelect(long sell_num)throws Exception{
		return paymentMapper.productSelect(sell_num);
	}
	
	public int paymentCharge(PayVO payVO)throws Exception{
		return paymentMapper.paymentCharge(payVO);
	}
	public int paymentSell(PayVO payVO)throws Exception{
		return paymentMapper.paymentSell(payVO);
	}
	public int paymentBuyCancle(PayVO payVO)throws Exception{
		return paymentMapper.paymentBuyCancle(payVO);
	}
	public int paymentOut(PayVO payVO)throws Exception{
		return paymentMapper.paymentOut(payVO);
	}
	public int paymentCalculate(PayVO payVO)throws Exception{
		return paymentMapper.paymentCalculate(payVO);
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
	
	public int tradingReceiveUp(TradingVO tradingVO)throws Exception{
		return paymentMapper.tradingReceiveUp(tradingVO);
	}
	
	public int buy_statusUp(Buy_HistoryVO buy_HistoryVO)throws Exception{
		return paymentMapper.buy_statusUp(buy_HistoryVO);
	}
	
	public int tradingGiveUp(TradingVO tradingVO)throws Exception{
		return paymentMapper.tradingGiveUp(tradingVO);
	}
	
	public int sell_statusUp(Sell_HistoryVO sell_HistoryVO)throws Exception{
		return paymentMapper.sell_statusUp(sell_HistoryVO);
	}
	
	public TradingVO tradingSelect(long trading_num)throws Exception{
		return paymentMapper.tradingSelect(trading_num);
	}
	
	public TradingVO tradingSellNumSelect(long sell_num)throws Exception{
		return paymentMapper.tradingSellNumSelect(sell_num);
	}
	
	public int tradingDelete(long trading_num)throws Exception{
		return paymentMapper.tradingDelete(trading_num);
	}
	
	public List<Sell_HistoryVO>  seller_check(String seller_id)throws Exception{
		return paymentMapper.seller_check(seller_id);
	}
	
	public int del_buyHistory(long trading_num)throws Exception{
		return paymentMapper.del_buyHistory(trading_num);
	}
	
	public int del_sellHistory(long trading_num)throws Exception{
		return paymentMapper.del_sellHistory(trading_num);
	}
	
	public int product_sell_statusUp(long sell_num)throws Exception{
		return paymentMapper.product_sell_statusUp(sell_num);
	}
	public int paycheckInsert(PayCheckVO payCheckVO)throws Exception{
		return paymentMapper.paycheckInsert(payCheckVO);
	}
	public String paycheckSelect(String mem_id)throws Exception{
		return paymentMapper.paycheckSelect(mem_id);
	}
	public int paycheckDel(String mem_id)throws Exception{
		return paymentMapper.paycheckDel(mem_id);
	}
	
	public MemberVO memberVOSel(String mem_id)throws Exception{
		return paymentMapper.memberVOSel(mem_id);
	}
	
	public int paystatsInsert(PayStatsVO payStatsVO) throws Exception{
		return paymentMapper.paystatsInsert(payStatsVO);
	}
	
	public long buy_status(long trading_num)throws Exception{
		return paymentMapper.buy_status(trading_num);
	}
	
	public long sell_status(long trading_num)throws Exception{
		return paymentMapper.sell_status(trading_num);
	}
	
	public Buy_HistoryVO buy_Sel(long trading_num)throws Exception{
		return paymentMapper.buy_Sel(trading_num);
	}
	
	public Sell_HistoryVO sell_Sel(long trading_num)throws Exception{
		return paymentMapper.sell_Sel(trading_num);
	}
	
	
	public int buy_cancelUp(long buy_cancel)throws Exception{
		return paymentMapper.buy_cancelUp(buy_cancel);
	}
	
	public int sell_cancelUp(long sell_cancel)throws Exception{
		return paymentMapper.sell_cancelUp(sell_cancel);
	}

	public SaveCashVO selectSC(String mem_id)throws Exception{
		return saveCashRepository.selectSC(mem_id);
	}
	
	public int createSC(String mem_id)throws Exception{
		return saveCashRepository.createSC(mem_id);
	}
	
	public int updateSC(SaveCashVO saveCashVO)throws Exception{
		return saveCashRepository.updateSC(saveCashVO);
	}
	
	public int product_cancel_status(long sell_num)throws Exception{
		return paymentMapper.product_cancel_status(sell_num);
	}
	public long auto_incrementNum() throws Exception{
		return paymentMapper.auto_incrementNum();
	}
}
