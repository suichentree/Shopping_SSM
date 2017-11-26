<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<div class="page-header">
<p class="text-left"><h2>我的订单</h2></p>
<table class="table table-hover" id="order_table">
  <tr>
  	<td>订单编号</td><td>订单总价</td><td>订单创建日期</td><td>客户</td><td>订单状态</td><td>查看</td>
  </tr>
</table>
<hr/>
</div>


<!-- 不同订单中的商品信息-模态框 -->

<div class="modal fade" id="order_goodsModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">商品信息:</h4>
      </div>
      <div class="modal-body">
       		<table class="table table-hover" id="order_goods_table">
				  <tr>
				  	<td>商品名称</td><td>单价</td><td>商品数量</td>
				  </tr>
			</table>
       		
       		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>