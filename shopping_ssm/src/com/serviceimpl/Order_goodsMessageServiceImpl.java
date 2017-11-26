package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Order_goodsMessagedao;
import com.entity.Order_goodsMessage;
import com.service.Order_goodsMessageService;
@Service
public class Order_goodsMessageServiceImpl implements Order_goodsMessageService {
	
	@Autowired
	private Order_goodsMessagedao order_gmdao;
	
	@Override
	public int insertOrder_goodsMessage(Order_goodsMessage ordergm) {
		
		return order_gmdao.insertOrder_goodsMessage(ordergm);
	}

	@Override
	public int deleteOrder_goodsMessage(Order_goodsMessage ordergm) {
		
		return order_gmdao.deleteOrder_goodsMessage(ordergm);
	}

	@Override
	public int updateOrder_goodsMessage(Order_goodsMessage ordergm) {
		
		return order_gmdao.updateOrder_goodsMessage(ordergm);
	}

	@Override
	public List<Order_goodsMessage> selectOrder_goodsMessage(
			Order_goodsMessage ordergm) {
		
		return order_gmdao.selectOrder_goodsMessage(ordergm);
	}

	@Override
	public List<Order_goodsMessage> selectAllOrder_goodsMessage() {
	
		return order_gmdao.selectAllOrder_goodsMessage();
	}

}
