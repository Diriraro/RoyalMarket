package com.iu.s1.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

@Component
public class FilePathGenerator {

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

}
