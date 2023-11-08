package com.example.demo.service;

import java.util.List;

import com.example.demo.DTO.User;

public interface testService {

	public void insertUser(User user);
	public List<String> getIds();
}
