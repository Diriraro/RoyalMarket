package com.iu.s1.shop.review;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s1.shop.review.reviewFile.StoreReviewFileRepository;
import com.iu.s1.shop.review.reviewFile.StoreReviewFileVO;
import com.iu.s1.util.FileManager;
import com.iu.s1.util.FilePathGenerator;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewRepository storeReviewRepository;
	
	@Autowired
	private StoreReviewFileRepository storeReviewFileRepository;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${review.filePath}")
	private String filePath;
	
	
	//파일과 함께 리뷰인설트
	public int setInsertReview(StoreReviewVO storeReviewVO,MultipartFile[] files) throws Exception{
		File file = filePathGenerator.getUseClassPathResource(filePath);
		
		int result = storeReviewRepository.setInsertReview(storeReviewVO);
		
		for (MultipartFile multipartFile : files) {
			if(multipartFile.getSize() <= 0){
				continue;
			}
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			StoreReviewFileVO vo = new StoreReviewFileVO();
			
			vo.setRe_num(storeReviewVO.getRe_num());
			vo.setFile_name(fileName);
			vo.setOri_name(multipartFile.getOriginalFilename());
			
			result = storeReviewFileRepository.reviewFileInsert(vo);
			System.out.println(fileName+" 리뷰파이리 름확임");
			
		}
		return result;
	}
	// 파일이름확인
	public String selectFileName(long re_num)throws Exception {
		return storeReviewRepository.selectFileName(re_num);
	}
	
	// 파일 리스트
	
	public List<StoreReviewFileVO> reviewFileSelect(long re_num)throws Exception{
		return storeReviewFileRepository.reviewFileSelect(re_num);
	}
	
	
	//
	public int setDeleteReview(StoreReviewVO storeReviewVO) throws Exception {
		
		int result = storeReviewRepository.setDeleteReview(storeReviewVO);
		
		return result;
	}
	
	//
	public List<StoreReviewVO> getSelectListReview(StoreReviewVO storeReviewVO) throws Exception {
		
		return storeReviewRepository.getSelectListReview(storeReviewVO);
	}
	
	// getSelectsell_num_mem_storeNum 
	
	public long getSelectsell_num_mem_storeNum(long sell_num)throws Exception{
		
		return storeReviewRepository.getSelectsell_num_mem_storeNum(sell_num);
	}
	
	// getSelectSell_num_sell_product
	
	public String getSelectSell_num_sell_product(long sell_num)throws Exception{
		return storeReviewRepository.getSelectSell_num_sell_product(sell_num);
		
	}
	
	// reco
	public long reco(long mem_storeNum)throws Exception{
		return storeReviewRepository.reco(mem_storeNum);
		
	}
	
	// recheck
	public StoreReviewVO recheck(long sell_num) throws Exception{
		return storeReviewRepository.recheck(sell_num);
		
	}
	
	
}
