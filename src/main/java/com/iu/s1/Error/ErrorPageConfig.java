package com.iu.s1.Error;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageConfig implements ErrorController{
	
	private static final String ERROR_PATH = "/error";
	 
    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
    
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
        String msg = "";
        if(status.toString().equals("404")) {
        	msg = "잘못된 경로입니다.";
        } else if (status.toString().equals("500")) {
        	msg = "잘못된 요청입니다.";
        } else if (status.toString().equals("403")) {
        	msg = "권한이 없습니다.";
        } else if (status.toString().equals("405")) {
        	msg = "잘못된 전달방식 입니다.";
        } else {
        	msg = "잘못된 파라미터 입니다.";
        }
        model.addAttribute("code", msg);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일  HH시 mm분 ss초");
        String date =sdf.format(new Date());
        model.addAttribute("timestamp", date);
        return "error/error";
    }
	
}
