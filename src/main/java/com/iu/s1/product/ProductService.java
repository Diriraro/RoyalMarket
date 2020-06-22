package com.iu.s1.product;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s1.product.productFIle.ProductFileDAO;
import com.iu.s1.product.productFIle.ProductFileVO;
import com.iu.s1.util.FileManager;
import com.iu.s1.util.FilePathGenerator;
import com.iu.s1.util.Pager;

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
	
	@Value("${product.filePath}")
	private String filePath;
	
	public int productInsert(ProductVO productVO, MultipartFile[] files) throws Exception{
		
		
		File file = filePathGenerator.getUseClassPathResource(filePath);
		int result = productDAO.productInsert(productVO);
		for (MultipartFile multipartFile : files) {
			if (multipartFile.getSize()<=0) {
				continue;
			
		}
		String fileName=fileManager.saveFileCopy(multipartFile, file);
		ProductFileVO vo = new ProductFileVO();
		vo.setSell_num(productVO.getSell_num());
		vo.setFile_name(fileName);
		vo.setOri_name(multipartFile.getOriginalFilename());
		
		result = productFileDAO.productFileInsert(vo);
		System.out.println(fileName);
		
		}
		
		return result;
	}
	
	public List<ProductFileVO> productFileSelect(long sell_num)throws Exception{
		return productFileDAO.productFileSelect(sell_num);
	}
	
	public String selectFileName(long sell_num)throws Exception{
		return productFileDAO.selectFileName(sell_num);
	}
	
	public List<ProductVO> productList(Pager pager) throws Exception{
		return productDAO.productList(pager);
	}
	
}
