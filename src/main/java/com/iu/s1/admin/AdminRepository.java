package com.iu.s1.admin;


import org.springframework.data.jpa.repository.JpaRepository;

import com.iu.s1.visitor.VisitorVO;

public interface AdminRepository extends JpaRepository<VisitorVO, String> {

//	@Transactional
//	@Modifying
//	@Query(nativeQuery = true, value = "select * from visitor where day =?1")
//	List<VisitorVO> visitorSearch(String day);
//	
//	@Transactional
//	@Modifying
//	@Query(nativeQuery = true, value = "Insert into visitor values(?1, ?2)")
//	void visitorInsert(String day, long count);
//
//	@Transactional
//	@Modifying
//	@Query(nativeQuery = true, value = "update visitor set count = ?1 where day > ?2")
//	void visitorUpdate(long count, String day);
}
