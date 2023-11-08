package com.example.demo.DTO;

public class BooksDTO {

	private String B_ID;
	private String ISBN;
	private String B_STATE;
	private String B_STOCK;
	public String getB_ID() {
		return B_ID;
	}
	public BooksDTO(String b_ID, String iSBN, String b_STATE, String b_STOCK) {
		super();
		B_ID = b_ID;
		ISBN = iSBN;
		B_STATE = b_STATE;
		B_STOCK = b_STOCK;
	}
	public void setB_ID(String b_ID) {
		B_ID = b_ID;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getB_STATE() {
		return B_STATE;
	}
	public void setB_STATE(String b_STATE) {
		B_STATE = b_STATE;
	}
	public String getB_STOCK() {
		return B_STOCK;
	}
	public void setB_STOCK(String b_STOCK) {
		B_STOCK = b_STOCK;
	}
	
	
}
