package com.iu.s1.product;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s1.product.productFIle.ProductFileDAO;
import com.iu.s1.product.productFIle.ProductFileVO;
import com.iu.s1.util.FileManager;
import com.iu.s1.util.FilePathGenerator;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductFileDAO productFileDAO;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Autowired
	private FileManager fileManager;
	
	private String filePath;
	
	public int setInsert(ProductVO productVO, MultipartFile[] files) throws Exception{
		
		File file = filePathGenerator.getUseClassPathResource(filePath);
		
		int result = productDAO.setInsert(productVO);
		
		for (MultipartFile multipartFile : files) {
			if (multipartFile.getSize()<=0) {
				continue;
			
		}
		String fileName=fileManager.saveFileCopy(multipartFile, file);
		ProductFileVO vo = new ProductFileVO();
		vo.setSell_num(productVO.getSell_num());
		vo.setFileName(fileName);
		vo.setOriName(multipartFile.getOriginalFilename());
		
		result = productFileDAO.setInsert(vo);
		
		
		}
		return result;
	}
}
