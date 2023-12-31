package com.example.demo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.DTO.BooksDTO;
import com.example.demo.service.StockService;

@Controller
public class AdminController {

	int stockState = 0;
	
	List<BooksDTO> a;
	
	@Autowired
	private StockService stockService;
	
	@RequestMapping("admin")
	public String admin() {
		return "admin";
	}
	
	//!!!!!!!미구현 알림!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("notyet")
	public String notyet() {
		return "test";
	}
	
	@RequestMapping("isbn")
	public String isbn() {
		return "isbn";
	}
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	@RequestMapping("admin/stock-count")
	public String stockCount(@RequestParam(required = false) String stock,Model model) {
		a=stockService.selectBooksByNStateAndNStock();
		if (stock==null) {
			//체크안됨
			model.addAttribute("book_one",stockService.selectBooksByNStateAndNStock());
			//체크됨
			model.addAttribute("book_two",stockService.selectBooksByNStateAndYStock());
			//대여 책 표시 
			//model.addAttribute("book_three",stockService.selectBooksByYState());
			//조사완료 버튼
			model.addAttribute("stock_state",stockState);
			return "admin/stock-count-list";
		}else if (stock.equals("start")) {
			if (stockState ==0) stockState = 1;
			model.addAttribute("stock_state",stockState);
			return "admin/stock-count-scan";
		}else if(stock.equals("finish")) {
			model.addAttribute("book_one",stockService.selectBooksByNStateAndNStock());
			//체크됨
			model.addAttribute("book_two",stockService.selectBooksByNStateAndYStock());
			//대여 책 표시 
			//model.addAttribute("book_three",stockService.selectBooksByYState());
			//조사완료 버튼
			stockState = 0;
			model.addAttribute("stock_state",stockState);
			return "admin/stock-count-list";
		}
		
		return "";
	}
	
	
	//ajax  모음-------------------------------
	
	//카메라 확인 후 n초기화
	@RequestMapping("/stock-camera-ok")
	@ResponseBody
	public String isCamera(@RequestParam String cameraState) {
		stockState = Integer.parseInt(cameraState);
		System.out.println(cameraState+"	camera state is ok?");
		if(cameraState.equals("2")) {
			stockService.updateInitialNStock();
			System.out.println(cameraState+"	camera state is ok?");
		}
		return "{ data: 2 }";
	}
	//스캔 완료시 y로 변경 후 리턴
	@RequestMapping("/stock-is-exist")
	@ResponseBody
	public BooksDTO isExist(@RequestParam String id) {
		stockService.updateyStockByBId(id);
		return stockService.selectBooksByBId(id);
	}
		
	//테스트용	
	@RequestMapping("/admin/testx")
	public String asd() {
		return "/admin/testxcz";
	}
	
}
