package com.dao;

import java.util.List;
import com.entity.Order_goodsMessage;
public interface Order_goodsMessagedao {
	public int insertOrder_goodsMessage(Order_goodsMessage ordergm);
	public int deleteOrder_goodsMessage(Order_goodsMessage ordergm);
	public int updateOrder_goodsMessage(Order_goodsMessage ordergm);
	public List<Order_goodsMessage> selectOrder_goodsMessage(Order_goodsMessage ordergm);	
	public List<Order_goodsMessage> selectAllOrder_goodsMessage();
}
