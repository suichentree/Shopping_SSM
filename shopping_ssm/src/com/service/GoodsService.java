package com.service;

import java.util.List;

import com.entity.Goods;

public interface GoodsService {
	public int insertGoods(Goods gods);
	public int deleteGoods(Goods gods);
	public int updateGoods(Goods gods);
	public List<Goods> selectGoods(Goods gods);
	public Goods selectGoodsByname(String goods_name);
	public List<Goods> selectAllGoods();
}
