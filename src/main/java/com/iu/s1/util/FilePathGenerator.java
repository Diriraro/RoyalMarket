package com.iu.s1.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

@Component
public class FilePathGenerator {
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private ServletContext servletContext;
	//static/upload/notice
	//static/upload/qna
	
	//1번쨰 방법
	public File getUseResourceLoader (String path) throws Exception{
		//resourceLoader
		//classes 경로를 받아오기위해 사용
		//생성하려는 디렉토리가 없으면 에러발생
		//Default로 만들어진 static 를 이용해서 File객체를 생성
		//하위 디렉토리를 child로 사용해 디렉토리 생성
		
		String dafaultPath="classpath:/static/";
		
		File file = resourceLoader.getResource(dafaultPath).getFile();
		
		file = new File(file, path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(file.getAbsolutePath());
		
		return file;
	}
	//2번쨰방법
	public File getUseClassPathResource(String path) throws Exception{
		//ClassPathResource
		//classes 경로를 받아 오기 위해 사용
		//ResourceLoader와 같지만
		//시작 경로에 classpath를 제외
		//개발자가 직접 객체를 생성
		String defaultPath = "static";
		
		ClassPathResource classPathResource = new ClassPathResource(defaultPath);

		File file = classPathResource.getFile();
		
		file = new File(file, path);
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(file.getAbsolutePath());
		return file;
	}
	//3번쨰 방법 (사용권장X)
	public File getUseServletContext(String path)throws Exception{
		//servlet context
		//classpath가 아니라 webapp 하위에 만들어짐
		//생성할 디렉토리가 static이라면
		//web하위에 static 폴더가 하나더 만들어짐
		path = servletContext.getRealPath(path);
		
		File file = new File(path);
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(path);
		
		return file;
	}
}
