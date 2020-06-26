package com.iu.s1.member;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
@Entity
@Table(name = "member")
public class MemberVO {
	
	@Id
	@NotEmpty
	private String mem_id;
	
	@Size(min = 6, max = 16)
	@Column
	@NotEmpty
	private String mem_pw;
	
	@Transient
	private String pwCheck;
	
	@Column
	@NotEmpty
	private String mem_name;
	
	@Column
	@NotEmpty
	@Email
	private String mem_email;
	
	@Size(min = 10, max = 11)
	@Column
	private String mem_phone;
	
	@Transient
	private String phoneCheck;
	
	@Column
	private long mem_storeNum;
	
	@Column
	private String mem_storeName;
	
	@Column
	private String mem_address;
	
	@Transient
	@NotEmpty
	private String road_address;
	
	@Transient
	private String detail_address;
	
	@Column
	private long mem_point;
	
	@Transient
	private String kind;
		
	@Transient
	private String search;
		
	@Column
	private long mem_access;
	
	@Column
	private Date mem_regDate;
	
	@Column
	private long mem_kakao;
	


}
