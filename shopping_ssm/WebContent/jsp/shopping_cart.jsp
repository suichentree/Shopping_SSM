<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="page-header">
<p class="text-left"><h2>我的购物车</h2></p>

<table class="table table-hover" id="shoppingcart_table">
  <tr>
  	<td>商品名称</td><td>单价</td><td>商品数量</td><td>操作商品</td>
  </tr>
 
 
</table>
<hr/>
<p class="text-right"><span style="margin-right:150px;font-size:15px;color:red;">总金额:<span id="sum_price" style="font-size:15px;color:red;"></span>￥</span></p>
<p class="text-right"><a style="margin-right:20px;" class="btn btn-primary" href="#" role="button" onclick="pay_money();"><span style="font-size:17px;" id="pay_money" >结算</span></a></p>
</div>

