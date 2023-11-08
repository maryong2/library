package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.DTO.User;
import com.example.demo.ServiceImpl.testServiceImp;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReturnController {

	@Autowired
	private testServiceImp serviceImp;
	
	
	@GetMapping("books")
	public String books(HttpSession session, @RequestParam(required = false) String id) {
		System.out.println(session.getAttribute("bookId"));
		if(id != null) session.setAttribute("bookId", id);
		return "books";
	}
	
	@PostMapping("return")
	public String bookReturn(HttpSession session, @RequestParam(required = false) String id) {
		if(session.getAttribute("bookId")== null)session.setAttribute("bookId", id);
		return "return";
	}
	@RequestMapping("return/check")
	public String returnCheck(@RequestParam String employeeId,HttpSession session, Model model) {
		//분기점 입력되는 사번과 책을 빌린 사번에 따라 나뉘는 분기점
		// service.checkState(session.getAttribute("bookId));
		if (employeeId.equals("1")) {
			model.addAttribute("state", "현재 책의 대여자와 입력한 사번이 불일치하여 반납에 실패하셨습니다.");
		}else if(employeeId.equals("2")){
			model.addAttribute("state", "반납이 완료되셨습니다.");
		}
		return "returnCheck";
	}
	@RequestMapping("return/sessionKill")
	public String sessionKill(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/books";
	}
	
	@RequestMapping("qrgen")
	public String qrgen() {
		return "qrgen";
	}
	
	
	@RequestMapping({ "extension", "assignment" })
	public String less() {
		return "test";
	}
	
	//////////////////////////db테스트//////////////////////////
	@RequestMapping("soso")
	public String soso() {
		return "soso";
	}
	@PostMapping("sososo")
	public String sososo(@ModelAttribute User user) {
		System.out.println("asd");
		if(user == null) return "soso";
		serviceImp.insertUser(user);
		return "redirect:/soso";
	}
	@RequestMapping("/get-ids")
	@ResponseBody
	public List<String> getId() {
		return serviceImp.getIds();
	}
	
	@RequestMapping("/rent")
	public String cd() {
		return "rent-record";
	}
}
