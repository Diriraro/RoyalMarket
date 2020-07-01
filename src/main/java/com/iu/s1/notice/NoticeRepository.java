package com.iu.s1.notice;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iu.s1.notice.NoticeVO;

public interface NoticeRepository extends JpaRepository<NoticeVO, Long> {
	
}
