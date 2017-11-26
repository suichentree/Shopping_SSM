<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="col-md-5 col-md-offset-3">
			  <form class="navbar-form navbar-left" role="search">
			  <div class="form-group">
			    <input type="text" id="Search_goodsname" class="form-control" placeholder="Search">
			  </div>
			  <button type="button" class="btn btn-default" onclick="Search_goodsBygoodsname();">查询</button>
			  <button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#add_goods">增加</button>
			  </form>		  
	</div>
</div>    
    
    
<table class="table table-hover" id="goods_table">
	<tr>
		<td>商品编号</td>
		<td>商品类别</td>
		<td>商品名称</td>
		<td>适用人群</td>
		<td>市场价</td>
		<td>销售价</td>
		<td>生产日期</td>
		<td>删除</td>
		<td>修改</td>
		
			
	</tr>
	<!-- ajax 加载 用户信息 -->
	<!--  
	<tr>
		<td>food</td>
		<td>面皮</td>
		<td>青年</td>
		<td>10</td>
		<td>8</td>
		<td>2017.7.7</td>	
	</tr>
	-->
</table>

<!-- 修改商品信息的模态框 -->

<div class="modal fade" id="goods_MessageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">商品编号:<span id="gid"></span></h4>
      </div>
      <div class="modal-body">
     		<!-- <div class="row">
	          	<div class="col-md-12">
	         	 <label for="gname">商品编号</label>
		    	<input type="text" class="form-control" id="gid">
		    	</div>
	         
	        </div> -->
      		<div class="row">
	          	<div class="col-md-6">
	         	 <label for="gname">商品名称</label>
		    	<input type="text" class="form-control" id="gname">
		    	</div>
	          <div class="col-md-6">
	          	  <label for="gtype">商品类别</label>
	          	  <select class="form-control" id="gtype">
				  <option>food</option>
				  <option>car</option>
				  <option>cloth</option>
				  <option>it</option>
				</select>	          
	          </div>
	        </div>
	        <div class="row">	
	          <div class="col-md-6">
	          	  <label for="gsuitpeople">适用人群</label>
	          	  <select class="form-control" id="gsuitpeople">
				  <option>儿童</option>
				  <option>青年</option>
				  <option>成年</option>
				  <option>老年</option>				  
				  </select>	          
	          </div>
	          <div class="col-md-6">
	         	 <label for="gmarket_price">市场价</label>
		    	<input type="text" class="form-control" id="gmarket_price">
		    	</div>
	        </div>
	        <div class="row">	
	          	<div class="col-md-6">
	          	<label for="gshop_price">销售价</label>
		    	<input type="text" class="form-control" id="gshop_price">
		    	</div>
		    	<div class="col-md-6">
	          	<label for="gcreatetime">生产日期</label>
		    	<input type="date" class="form-control" id="gcreatetime">
		    	</div>
				          
	        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save_goods()">Save changes</button>       <!-- data-dismiss="modal",作用是点击按钮，关闭模态框 -->
      </div>
    </div>
  </div>
</div>


<!-- 增加商品信息的模态框 -->

<div class="modal fade" id="add_goods" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加商品</h4>
      </div>
      <div class="modal-body">
      		<div class="row">
	          	<div class="col-md-6">
	         	 <label for="gname">商品名称</label>
		    	<input type="text" class="form-control" id="add_gname">
		    	</div>
	          <div class="col-md-6">
	          	  <label for="gtype">商品类别</label>
	          	  <select class="form-control" id="add_gtype">
				  <option>food</option>
				  <option>car</option>
				  <option>cloth</option>
				  <option>it</option>
				</select>	          
	          </div>
	        </div>
	        <div class="row">	
	          <div class="col-md-6">
	          	  <label for="gsuitpeople">适用人群</label>
	          	  <select class="form-control" id="add_gsuitpeople">
				  <option>儿童</option>
				  <option>青年</option>
				  <option>成年</option>
				  <option>老年</option>				  
				  </select>	          
	          </div>
	          <div class="col-md-6">
	         	 <label for="gmarket_price">市场价</label>
		    	<input type="text" class="form-control" id="add_gmarket_price">
		    	</div>
	        </div>
	        <div class="row">	
	          	<div class="col-md-6">
	          	<label for="gshop_price">销售价</label>
		    	<input type="text" class="form-control" id="add_gshop_price">
		    	</div>
		    	<div class="col-md-6">
	          	<label for="gcreatetime">生产日期</label>
		    	<input type="date" class="form-control" id="add_gcreatetime"/>
		    	</div>
				          
	        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="add_goods()">Save changes</button>       <!-- data-dismiss="modal",作用是点击按钮，关闭模态框 -->
      </div>
    </div>
  </div>
</div>

