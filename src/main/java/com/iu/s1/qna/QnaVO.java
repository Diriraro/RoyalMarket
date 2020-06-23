package com.iu.s1.qna;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {

	private long qna_num;
	private String qna_kind;
	private String mem_id;
	private String qna_contents;
	private Date qna_regDate;
	private int qna_check;
	private Date qna_checkDate;
	
}
