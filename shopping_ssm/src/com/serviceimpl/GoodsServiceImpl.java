package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Goodsdao;
import com.entity.Goods;
import com.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private Goodsdao goodsdao;
	
	@Override
	public int insertGoods(Goods gods) {
	
		return goodsdao.insertGoods(gods);
	}

	@Override
	public int deleteGoods(Goods gods) {
		
		return goodsdao.deleteGoods(gods);
	}

	@Override
	public int updateGoods(Goods gods) {
		
		return goodsdao.updateGoods(gods);
	}

	@Override
	public List<Goods> selectGoods(Goods gods) {
		
		return goodsdao.selectGoods(gods);
	}

	@Override
	public List<Goods> selectAllGoods() {
		
		return goodsdao.selectAllGoods();
	}

	@Override
	public Goods selectGoodsByname(String goods_name) {
		
		return goodsdao.selectGoodsByname(goods_name);
	}

}
