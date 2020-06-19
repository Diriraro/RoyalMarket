package com.iu.s1.member;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
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
	private String mem_pw;
	
	@Transient
	private String pwCheck;
	
	@Column
	private String mem_name;
	
	@Column
	private String mem_email;
	
	@Column
	private String mem_phone;
	
	@Column
	private long mem_storeNum;
	
	@Column
	private String mem_storeName;
	
	@Column
	private String mem_address;
	
	@Column
	private long mem_point;
	
	private String kind;
	
	private String search;


}
