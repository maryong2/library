package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.DTO.User;

@Mapper
public interface TestMapper {
	
	public void insertUser(User user);
	public List<String> getIds();
}
