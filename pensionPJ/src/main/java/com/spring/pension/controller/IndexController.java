package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pension.domain.WeatherCrolling;

@Controller
@RequestMapping("/main/*")
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/index" ,method=RequestMethod.GET)
	public String main() {
		logger.info("메인페이지로 이동");
		return "/index/index";
		
	}
	@RequestMapping(value="/intro" ,method=RequestMethod.GET)
	public String intro() {
		logger.info("소개 페이지로 이동");
		return "/index/intro";
	}
	//daummap 사용해서 지도 출력 
	@RequestMapping(value="/directions" ,method=RequestMethod.GET)
	public String map() {
		 
		return "/index/directions";
	}
	//팝업창
	@RequestMapping(value="/popup",method=RequestMethod.GET)
	public String popup() {
		
		return "/index/popup";
	}
	//주변관광지 보는 부분 
	@RequestMapping(value="/tourist",method=RequestMethod.GET)
	public String tourist() throws Exception {
		
		return "/tourist/tourist";
	}
	//크롤링 연습 긁어오는 부분
	@RequestMapping(value="/croll",method=RequestMethod.GET)
	public void croll(Model model) throws Exception {
		
		
		WeatherCrolling croll = new WeatherCrolling();
		
		model.addAttribute("weather", croll.getWeahterText());
		
	}
	@RequestMapping(value="/adrress", method=RequestMethod.GET)
	public String adrress() throws Exception {
		
		return "/index/ex";
	}
}
