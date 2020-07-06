package com.iu.s1.notice;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;

import com.iu.s1.notice.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name="notice")
@DynamicUpdate(value = true)
public class NoticeVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="no_num")
	private long nonum;
	@Column(name="no_title")
	private String notitle;
	@Column
	@CreationTimestamp
	private Date no_regDate;
	@Column
	private String no_contents;
	
}
