package com.iu.s1.notice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iu.s1.notice.NoticeVO;

public interface NoticeRepository extends JpaRepository<NoticeVO, Long> {
	
	public List<NoticeVO> findByNotitleContainingOrderByNonumDesc(String search);
	
	public List<NoticeVO> findAllByOrderByNonumDesc();
}
