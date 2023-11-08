package com.example.demo.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DTO.BooksDTO;
import com.example.demo.mapper.adminStockMapper;
import com.example.demo.service.StockService;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private adminStockMapper stockMapper;
	public void updateInitialNStock() {
		stockMapper.updateInitialNStock();
	}
	public void updateyStockByBId(String id) {
		stockMapper.updateyStockByBId(id);
	}
	public BooksDTO selectBooksByBId(String id) {
		return stockMapper.selectBooksByBId(id);
	}
	public List<BooksDTO> selectBooksByYState() {
		return stockMapper.selectBooksByYState();
	}
	public List<BooksDTO> selectBooksByNStateAndNStock() {
		return stockMapper.selectBooksByNStateAndNStock();
	}
	public List<BooksDTO> selectBooksByNStateAndYStock() {
		return stockMapper.selectBooksByNStateAndYStock();
	}
	
	
	
}
