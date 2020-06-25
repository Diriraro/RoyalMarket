package com.iu.s1.visitor;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "visitor")
public class VisitorVO {
	
	@Id
	private String day;
	
	@Column
	private long count;
}
