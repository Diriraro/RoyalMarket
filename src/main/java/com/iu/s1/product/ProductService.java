package com.iu.s1.product;

import java.io.File;
import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s1.member.MemberVO;
import com.iu.s1.product.productFile.ProductFileMapper;
import com.iu.s1.product.productFile.ProductFileVO;
import com.iu.s1.product.qna.ProductQnaMapper;
import com.iu.s1.product.qna.ProductQnaVO;
import com.iu.s1.product.zzim.ZzimMapper;
import com.iu.s1.product.zzim.ZzimVO;
import com.iu.s1.util.FileManager;
import com.iu.s1.util.FilePathGenerator;
import com.iu.s1.util.Pager;

import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Split;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private ProductFileMapper productFileMapper;

	@Autowired
	private ZzimMapper zzimMapper;

	@Autowired
	private ProductQnaMapper productQnaMapper;

	@Autowired
	private FilePathGenerator filePathGenerator;

	@Autowired
	private FileManager fileManager;

	@Value("${product.filePath}")
	private String filePath;

	public ProductVO productSelect(long sell_num) throws Exception {
		productMapper.hitUpdate(sell_num);
		return productMapper.productSelect(sell_num);
	}

	public int productInsert(ProductVO productVO, MultipartFile[] files) throws Exception {

		File file = filePathGenerator.getUseClassPathResource(filePath);

		int result = productMapper.productInsert(productVO);

		for (MultipartFile multipartFile : files) {
			if (multipartFile.getSize() <= 0) {
				continue;

			}
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			ProductFileVO vo = new ProductFileVO();
			vo.setSell_num(productVO.getSell_num());
			vo.setFile_name(fileName);
			vo.setOri_name(multipartFile.getOriginalFilename());

			result = productFileMapper.productFileInsert(vo);
			System.out.println(fileName);

		}
		return result;
	}

	public String selectFileName(long sell_num) throws Exception {
		return productMapper.selectFileName(sell_num);
	}

	public List<ProductFileVO> productFileSelect(long sell_num) throws Exception {
		return productFileMapper.productFileSelect(sell_num);
	}

	public List<ProductFileVO> productFileSelect2(long sell_num) throws Exception {
		return productFileMapper.productFileSelect2(sell_num);
	}

	public List<ProductVO> productList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = productMapper.productCount(pager);
		pager.makePage(totalCount);
		return productMapper.productList(pager);
	}

	public List<ProductVO> myProductList(Pager pager) throws Exception {
		pager.makeRow();
		long totalCount = productMapper.myProductCount(pager);
		pager.makePage(totalCount);
		return productMapper.myProductList(pager);
	}

	public List<ProductQnaVO> qnaList2(long sell_num) throws Exception {
		return productQnaMapper.qnaList2(sell_num);
	}

	public MemberVO productAddress(long sell_num) throws Exception {
		return productMapper.productAddress(sell_num);
	}

	public MemberVO productStoreName(long sell_num) throws Exception {
		return productMapper.productStoreName(sell_num);
	}

	public long productUpdate(ProductVO productVO) throws Exception {
		return productMapper.productUpdate(productVO);
	}

	public int zzimInsert(ZzimVO zzimVO) throws Exception {
		return zzimMapper.zzimInsert(zzimVO);
	}

	public ZzimVO zzimCheck(long mem_storeNum, long sell_num) throws Exception {
		return zzimMapper.zzimCheck(mem_storeNum, sell_num);
	}

	public int zzimDelete(ZzimVO zzimVO) throws Exception {
		return zzimMapper.zzimDelete(zzimVO);
	}

	public long zzimCount(long sell_num) throws Exception {
		return zzimMapper.zzimCount(sell_num);
	}

	// shop에서 쓸꺼
	public List<ProductVO> myList(long mem_storeNum) throws Exception {
		return productMapper.myList(mem_storeNum);
	}

	// shop 에서 쓸 상품co
	public long prodco(long mem_storeNum) throws Exception {

		return productMapper.prodco(mem_storeNum);
	}

	// shop에서 쓸 찜
	public List<ZzimVO> myzzim(long mem_storeNum) throws Exception {
		return zzimMapper.myzzim(mem_storeNum);
	}

	// shop에서 쓸 찜co

	public long zico(long mem_storeNum) throws Exception {
		return zzimMapper.zico(mem_storeNum);
	}

	public int productDelete(ProductVO productVO) throws Exception {
		return productMapper.productDelete(productVO);
	}

	public List<ProductVO> productSelectList(String sell_num) throws Exception {
		List<ProductVO> ar = new ArrayList<ProductVO>();
		String sell_num1[] = sell_num.split("/");
		for (int i = 0; i < sell_num1.length; i++) {
			if (i < 5) {
				System.out.println("sellnum 숫자"+sell_num1[i]);
				long sell_number = Integer.parseInt(sell_num1[i]);
				ar.add(productMapper.productSelect(sell_number));
			}
		}
		return ar;
	}

}
