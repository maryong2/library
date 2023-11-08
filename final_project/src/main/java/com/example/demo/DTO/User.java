package com.example.demo.DTO;

public class User {
    private String id;
    private String password;
    private String name;
    private int age;
    private char sex;
    
	public User(String id, String password, String name, int age, char sex) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.sex = sex;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public char getSex() {
		return sex;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}

    
}
