package com.iu.s1.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository {
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;

}
