package com.example.demo.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DTO.User;
import com.example.demo.mapper.TestMapper;
import com.example.demo.service.testService;

@Service
public class testServiceImp implements testService{
	
	@Autowired
	private TestMapper mapper;
	
	
	public void insertUser(User user) {
		mapper.insertUser(user);
	}
	public List<String> getIds(){
		return mapper.getIds();
	}

}
