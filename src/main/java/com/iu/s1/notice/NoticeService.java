package com.iu.s1.notice;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iu.s1.notice.NoticeVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService {
	
	@Autowired
	private NoticeRepository noticeRepository;
	
	public List<NoticeVO> noticeList()throws Exception{
		return noticeRepository.findAll();
	}
	
	public int noticeWrite(NoticeVO noticeVO)throws Exception{
		int result=0;
		noticeVO = noticeRepository.save(noticeVO);
		if(noticeVO!=null) {
			result=1;
		}
		return result;
	}
	
	public NoticeVO noticeSelect(NoticeVO noticeVO)throws Exception{
		Optional<NoticeVO> opt = noticeRepository.findById(noticeVO.getNonum());
		noticeVO = opt.get();
		return noticeVO;
	}
	
	public int noticeUpdate(NoticeVO noticeVO)throws Exception{
		int result=0;
		noticeVO = noticeRepository.save(noticeVO);
		if(noticeVO!=null) {
			result=1;
		}
		return result;
	}
	
	public void noticeDelete(long nonum)throws Exception{
		noticeRepository.deleteById(nonum);
	}

}
