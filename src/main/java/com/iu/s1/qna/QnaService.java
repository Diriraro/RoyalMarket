package com.iu.s1.qna;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s1.qna.file.QnaFileRepository;
import com.iu.s1.qna.file.QnaFileVO;
import com.iu.s1.util.FileManager;
import com.iu.s1.util.FilePathGenerator;

@Service
@Transactional(rollbackFor = Exception.class)
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;
	@Autowired
	private FilePathGenerator pathGenerator;	// 저장할 폴더의 경로
	@Autowired
	private FileManager fileManager;			// 실제 파일을 저장
	@Autowired
	private QnaFileRepository qnaFileRepository;
	
	@Value("${qna.filePath}")
	private String filePath;					//application.properties에서 키 값을 받아와 value값을 집어넣음
	
	public List<QnaVO> qnaMyList(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaMyList(qnaVO);
	}
	
	public int qnaWrite(QnaVO qnaVO, MultipartFile [] files)throws Exception{
		File file = pathGenerator.getUseClassPathResource(filePath);
		int result = qnaRepository.qnaWrite(qnaVO);
		for (MultipartFile multipartFile : files) {
			if(multipartFile.getSize()<=0) {
				continue;
			}
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			QnaFileVO vo = new QnaFileVO();
			long qna_num = qnaRepository.lastNum();		//qna_num이 auto_Increment라서 getter로 받아오면 0이라서 에러
			vo.setQna_num(qna_num);
			vo.setFile_name(fileName);
			vo.setOri_name(multipartFile.getOriginalFilename());
			
			result = result * qnaFileRepository.setInsert(vo);
			
			System.out.println(fileName);
		}
		
		return result;
	}
	
	public List<QnaVO> qnaAdminList()throws Exception{
		return qnaRepository.qnaAdminList();
	}
	
	public QnaVO selectQna(long qna_num)throws Exception{
		return qnaRepository.selectQna(qna_num);
	}
	
	public int qnaAnswer(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaAnswer(qnaVO);
	}
	
	public int fileCheck(long qna_num)throws Exception{
		int result =0;
		List<QnaFileVO> qnaFileVO = qnaFileRepository.fileCheck(qna_num);
		if(qnaFileVO.isEmpty()) {
			return result;
		}else {
			result=1;
			return result;
		}
	}
	
	public List<QnaFileVO> selectQnaFile(long qna_num)throws Exception{
		return qnaFileRepository.fileCheck(qna_num);
	}
	
}
