package com.potato.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class Exception_controller {

	@ExceptionHandler(Exception.class)
	public ModelAndView exception_controll(HttpServletRequest req, Exception ex) {
		ModelAndView result = new ModelAndView();
		result.addObject("exception",ex);
		result.addObject("message","로그인을 먼저 해주세요");
		result.setViewName("error");
		return result;
	}
	
}
