<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物</title>
<link href="../dill/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../dill/jq/jquery.js"></script>
<link href="../dill/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
<script src="../dill/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src="../dill/js/address_link.js"></script>
<script>
//校验用户输入的数据是否符合格式，所抽取的函数
function jy(ele,status,msg){
	//先清空之前的校验元素与校验提示信息
	
	$(ele).parent().removeClass("has-error has-success");
	$(ele).next("span").text("");
	if(status=="success"){
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text(msg);
	}else if(status=="error"){
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(msg);
	}
	return false;
}




//页面加载完成就执行的函数,所有商品的展示。

$(function(){
	$.ajax({
		type:"post",
		dataType:"json",  		
		url:"${pageContext.request.contextPath}/GoodsController/selectAllGoods",		                                                   
		success: function(result){  			
			$("#ajaxload").load('${pageContext.request.contextPath}/jsp/GoodsShow.jsp',function(){
				<!--把数据库的信息填充到页面中-->
			
				for(var i=0;i<result.length;i++){
					$("#goods").append("<div class='col-md-3' name='goods_card'><div class='thumbnail'><img src='../dill/img/10.jpg' alt='html书籍'>"+
							"<div class='caption'><p><a href='#' id='sp_name' style='font-size:20px'>"+result[i].name+"</a></p>"+
							"<p><a href='#'style='font-size:17px;' onclick='modelmessage(this)' data-toggle='modal' data-target='#message'>详情信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'style='font-size:15px;' onclick='add_shopping_cart(this);'>加入购物车</a></p><p style='color:red;'> 市场价：<del id='sp_marketprice'>"+result[i].market_price+"</del>"+
							"，销售价:<span id='sp_shopprice'>"+result[i].shop_price+"</span></p></div></div></div>");
					
				}
				
			
			});
			
			},
			error: function(){				
				alert("展示所有商品信息 , error");
			}
			
		});	
	
	

}); 



//退出登录
function back(){
	 var a=confirm("是否退出！！！");
     if(a){
    	window.location.href="http://localhost:8080/shopping_ssm/login.jsp"; 	
     }else{
       alert("退出失败！！！");
     }
}



//使用ajax 加载商品信息到  ajax 加载的GoodsShow页面中
function load(obj){
	$.ajax({
		type:"post",
		dataType:"json",  		
		url:"${pageContext.request.contextPath}/GoodsController/selectGoods",
		data:{"type":obj},                                                        //把函数的参数转化为json字符串
		success: function(result){   				//result 就是从GoodsController/selectGoods 方法的返回值,该返回值为一个对象数组。
			if(result==''){
				alert("你所选的商品暂时缺货！！！，请浏览其他商品！！！");
			}
		
			console.log(result);
			
			$("#ajaxload").load('${pageContext.request.contextPath}/jsp/GoodsShow.jsp',function(){
		
				<!--把数据库的信息填充到页面中-->
				
				/*
				for(var i=0;i<result.length;i++){
					var spname=document.getElementById("sp_name");
					var spmp=document.getElementById("sp_marketprice");
					var spsp=document.getElementById("sp_shopprice");
					spname.innerHTML=result.name;
					spmp.innerHTML=result.market_price;
					spsp.innerHTML=result.shop_price;
				}
				*/
				
				for(var i=0;i<result.length;i++){
					$("#goods").append("<div class='col-md-3' name='goods_card'><div class='thumbnail'><img src='../dill/img/10.jpg' alt='html书籍'>"+
							"<div class='caption'><p><a href='#' id='sp_name' style='font-size:20px'>"+result[i].name+"</a></p>"+
							"<p><a href='#'style='font-size:17px;' onclick='modelmessage(this)' data-toggle='modal' data-target='#message'>详情信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'style='font-size:15px;' onclick='add_shopping_cart(this);'>加入购物车</a></p><p style='color:red;'> 市场价：<del id='sp_marketprice'>"+result[i].market_price+"</del>"+
							"，销售价:<span id='sp_shopprice'>"+result[i].shop_price+"</span></p></div></div></div>");
					
				}
				
			
			});
		},
		error: function(){
			
			alert("laod,error");
		}
		
		
	});
	
}

//++++++++++++++++++++++++++++++++

//点击index.jsp的导航栏的购物车  加载购物车页面，只加载属于该用户的购物车

function shopping_cart(){
	
	var user_name=$("#user_name").html();        //获取登陆人的用户名
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/ShoppingcartController/selectShoppingcartByuser_nameandstatusandtime",
		data:{"user_name":user_name,"status":0},
		success:function(result){		
			$("#ajaxload").load("${pageContext.request.contextPath}/jsp/shopping_cart.jsp",function(){
				var sum_price=0;
				for(var i=0;i<result.length;i++){
					$("#shoppingcart_table").append("<tr><td>"+result[i].goods_name+"</td><td>"+result[i].goods_price+"</td><td>"+result[i].goods_count+"</td><td><a href='#' onclick='delete_shoppingcart_goods(this);'>删除</a></td></tr>");
					sum_price=sum_price+(result[i].goods_price*result[i].goods_count);                         //计算商品的总金额
				}
				
				document.getElementById("sum_price").innerHTML=sum_price;
				
				
					
			});
		},
		error:function(){
			alert("shopping_cart12121(), error");
		}
	});
	
	
}


//通过商品名称与用户名称删除购物车商品
function delete_shoppingcart_goods(obj){
	var user_name=$("#user_name").html();        //获取登陆人的用户名
	var good_name=$(obj).parents().parents().children("td").eq(0).text();        //$(obj) 指向当前标签   ，  eq(0) 第一个子标签
	alert(user_name+"   "+good_name);
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/ShoppingcartController/deleteShoppingcartByusername_goodsname",
		data:{"goods_name":good_name,"user_name":user_name},
		success:function(result){		
			alert("删除购物车商品成功");
			window.location.reload();
				
		},
		error:function(){
			alert("delete_shoppingcart_goods(), error");
		}
	});
	
	
}



//++++++++++++++++++++++
//当点击商品卡片的详情信息，弹出，商品信息模态框

function modelmessage(obj){
	//当点击详情信息时，获取点击的商品卡片的name
	var good_name=$(obj).parents().parents().children("p").eq(0).children().text();        //$(obj) 指向当前标签   ，  eq(0) 第一个子标签

	$.ajax({
	 type:"post",              			 			//提交方式为post
 	 dataType:"json",  								//当dataType 设置为json时，ajax所接受的数据必须符合json格式,否则，会一直执行error的回调函数。
     url:"${pageContext.request.contextPath}/GoodsController/selectGoods",
 	 data:{"name":good_name},  			//这里的data是从表单传来的数据,格式必须符合dataType的值，即为json的格式
     success: function(result){     		//result 就是从GoodsController/selectGoods 方法的返回值,该返回值为一个对象数组。
    	
     	// alert(result[0].name);
	
		
		
		$('#goods_name').text(result[0].name);						//点击商品卡片的详情信息把传来的数据填写到详情信息表格中
		$('#goods_type').text(result[0].type);
		$('#goods_suitpeople').text(result[0].suitpeople);
		$('#goods_marketprice').text(result[0].market_price);
		$('#goods_shopprice').text(result[0].shop_price);
		$('#createtime').text(result[0].createtime);
		
     },
     error : function() {
    	alert("modelmessage ,error");
    	
     }
 });
	
}  


//点击商品卡片，加入购物车按钮，触发的函数
 function add_shopping_cart(obj){
	var user_name=$("#user_name").html();        //获取登陆人的用户名
	
	var goods_name=$(obj).parents().parents().children("p").eq(0).children().text();
	
	
	$.ajax({
	 type:"post",              			 			//提交方式为post
 	 dataType:"json",  								//当dataType 设置为json时，ajax所接受的数据必须符合json格式,否则，会一直执行error的回调函数。
     url:"${pageContext.request.contextPath}/ShoppingcartController/insertShoppingcart",
 	 data:{"goods_name":goods_name,"user_name":user_name},  			//这里的data是从表单传来的数据,格式必须符合dataType的值，即为json的格式
     success: function(result){     		//result 就是从GoodsController/selectGoods 方法的返回值,该返回值为一个对象数组。
    	 console.log(result);
			alert("加入购物车成功！！！");
		
     },
     error : function() {
    	
			alert("add_shopping_cart(obj), error");
    	
     }
 });
} 



//点击我的信息弹出的模态框中的信息，用ajax 加载用户信息

function mymessage(){
	$("#username").parent().removeClass("has-error has-success");
	$("#username").next("span").text("");
	
	var user_name=$("#user_name").html();              //html() 函数获取 span标签的值
	$.ajax({
		 type:"post",              			 			//提交方式为post
	 	 dataType:"json",  								//当dataType 设置为json时，ajax所接受的数据必须符合json格式,否则，会一直执行error的回调函数。
	     url:"${pageContext.request.contextPath}/UserController/selectUserByusername",
	 	 data:{"username":user_name},  			//这里的data是从表单传来的数据,格式必须符合dataType的值，即为json的格式
	     success: function(result){     		//result 就是从GoodsController/selectGoods 方法的返回值,该返回值为一个对象数组。
	    	
	    	 $("#myMessageModel_table").empty();             //jQuery empty() 方法删除被选元素的子元素。达到清除缓存的作用。     
	    	 
	    	 if(result.status===0){
					result.status="普通用户";
			 }else if(result.status===1){
					result.status="VIP用户";
			 }else{
					result.status="管理员用户";
			 }
	    
	    	document.getElementById("user_id").innerHTML=result.id;                  //其他方式赋值
			document.getElementById("username").value=result.username;	
			document.getElementById("password").value=result.password;      		//给表单赋值
			document.getElementById("realname").value=result.realname;
			document.getElementById("gender").value=result.gender;
			document.getElementById("age").value=result.age;
			document.getElementById("phone").value=result.phone;
			document.getElementById("address").value=result.address; 
			document.getElementById("status").innerHTML=result.status;    
				
	    	 
	    	 
	    	
		  },
	     error : function() {
	    	alert("mymessage(), error");
	    	
	     }
	 });
}
 
//当要修改我的信息时，用户名，密码，电话的校验
 function jy_username(){
	var usname=$("#username").val();
	$("#username").parent().removeClass("has-error has-success");
	$("#username").next("span").text("");
	
	
	alert(usname);
	var regName=/(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;        //用户名6-16位或中文2-5位
	if(!regName.test(usname)){
		jy("#username","error","用户名格式不正确,必须是字母或数字5-16位或中文2-5位");
	}else{
		jy("#username","success","");
		
	}
	
	
}



 function jy_password(){
	var password=$("#password").val();
	$("#password").parent().removeClass("has-error has-success");
	$("#password").next("span").text("");
	
	
	alert(password);
	var regPassword=/^[a-z0-9_-]{4,18}$/;	
	if(!regPassword.test(password)){
		jy("#password","error","密码格式不正确");
	}else{
		jy("#password","success","");
		
	}
	
	
}
 

function jy_realname(){
	var realname=$("#realname").val();
	$("#realname").parent().removeClass("has-error has-success");
	$("#realname").next("span").text("");
	
	
	alert(realname);
	var regrealname=/^[\u2E80-\u9FFF]{2,5}/;	
	if(!regrealname.test(realname)){
		jy("#realname","error","真实姓名格式不正确");
	}else{
		jy("#realname","success","");
		
	}
	
}


function jy_age(){
	var age=$("#age").val();
	$("#age").parent().removeClass("has-error has-success");
	$("#age").next("span").text("");

	if((age<0)&&(age>120)){
		jy("#age","error","年龄格式不正确");
	}else{
		jy("#age","success","");
		
	}
	
}


// 点击我的信息模态框的保存信息按钮，出发ajax ，将这时模态框的信息 更新 到数据库中
function save_userMseeage(){
	var ass1=$("#province").find("option:selected").text();
	var ass2=$("#citys").find("option:selected").text();
	var ass3=$("#county").find("option:selected").text();
	
	var ass=ass1+ass2+ass3;
	alert(ass);
	
	$.ajax({
		type:"POST",
		dataType:"json",
		url:"${pageContext.request.contextPath}/UserController/updateUser",
		data:{"id":document.getElementById("user_id").innerHTML,"username":document.getElementById("username").value,"password":document.getElementById("password").value,"realname":document.getElementById("realname").value,"gender":document.getElementById("gender").value,"age":document.getElementById("age").value,"phone":document.getElementById("phone").value,"address":document.getElementById("address").value},
		success:function(result){
			
			alert("修改个人信息成功！！！");
			
		},
		error:function(){
			alert("save_userMseeage() , error");
		}
			
	});
	
}


//点击我的订单，ajax 加载 我的订单页面
function myorder(){
	var user_name=$("#user_name").html(); 
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/User_orderController/selectUser_orderByusername",
		data:{"username":user_name},
		success:function(result){
			
			$("#ajaxload").load('${pageContext.request.contextPath}/jsp/orderShow.jsp',function(){
				for(var i=0;i<result.length;i++){
					$("#order_table").append("<tr><td>"+result[i].id+"</td><td>"+result[i].sumprice+"</td><td>"+result[i].createtime+"</td><td>"+result[i].username+"</td><td>"+result[i].order_status+"</td><td><a href='#' onclick='showOrder_goods(this);'  data-toggle='modal' data-target='#order_goodsModel'>查询购买商品的详情信息</a></td></tr>");
				}
			});
		},
		error:function(){
			alert("myorder() , error");
		}
	
	});
	
	
	
	
	
}



//点击购物车的结算按钮，将购物车的信息，插入到用户订单表，并将该用户的购物表的状态改为1（0，为默认值，表示为付款，1表示已付款）
function pay_money(){
	var sumprice=$("#sum_price").text();
	if(sumprice==0){
		alert("购物车无商品，无法结算！！！");
		return false;
	}
	
	var sumprice=document.getElementById("sum_price").innerHTML;	//获取订单总金额
	var createtime=new Date().toLocaleString();				//获取订单生成日期		
	alert(createtime);
	var username=$("#user_name").html();               				//获取用户名
	var order_status="已付款";
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/ShoppingcartController/updateShoppingcartByuser_name",
		data:{"user_name":username,"status":1,"order_createtime":createtime},
		success:function(result){
				
				$.ajax({
					type:"post",
					dataType:"json",
					url:"${pageContext.request.contextPath}/User_orderController/insertUser_order",
					data:{"sumprice":sumprice,"createtime":createtime,"username":username,"order_status":order_status},
					success:function(result){
						alert("结算成功！！！");
						myorder();
					},
					error:function(){
						alert("pay_money1111() , error");
					}
		
				});
			
			
			
		},
		error:function(){
			alert("pay_money2222() , error");
		}
					
	});
	
}



function showOrder_goods(obj){
	var time=$(obj).parents().parents().children("td").eq(2).text();
	alert(time);
	var user_name=$("#user_name").html();        //获取当时登陆者的用户名 
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/ShoppingcartController/selectShoppingcartByuser_nameandstatusandtime",
		data:{"user_name":user_name,"status":1,"order_createtime":time},
		success:function(result){	
				$("tr[name='as']").remove();
				for(var i=0;i<result.length;i++){
					$("#order_goods_table").append("<tr name='as'><td>"+result[i].goods_name+"</td><td>"+result[i].goods_price+"</td><td>"+result[i].goods_count+"</td></tr>");
					
				}
				
							
		},
		error:function(){
			alert("showOrder_goods(), error");
		}
	});
	
	
}



//点击搜索框是搜索按钮，通过用户名查询商品信息
function Search_goodsBygoodsname(){
	var goods_name=document.getElementById("Search_goodsname").value;		
	alert(goods_name);
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/GoodsController/selectGoodsByname",
		data:{"goods_name":goods_name},
		success: function(result){
			if(result==null){
				alert("查询的商品不存在");
			}else{
				$("div[name='goods_card']").remove();                   //删除div标签中name="goods_card"的元素及其子元素
			}
			
			$("#goods").append("<div class='col-md-3' name='goods_card'><div class='thumbnail'><img src='../dill/img/10.jpg' alt='html书籍'>"+
						"<div class='caption'><p><a href='#' id='sp_name' style='font-size:20px'>"+result.name+"</a></p>"+
						"<p><a href='#'style='font-size:17px;' onclick='modelmessage(this)' data-toggle='modal' data-target='#message'>详情信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'style='font-size:15px;' onclick='add_shopping_cart(this);'>加入购物车</a></p><p style='color:red;'> 市场价：<del id='sp_marketprice'>"+result.market_price+"</del>"+
						"，销售价:<span id='sp_shopprice'>"+result.shop_price+"</span></p></div></div></div>");
						
		},
		error:function(){
			alert("Search_goodsBygoodsname(), error");
		}
		
	});
}
</script>

</head>
<body>
<style>
	 a:hover{color:red; }
	 .thumbnail:hover{border:1px solid red;}
	

</style>
<!-- 导航栏 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="navbar-header">    
      <a class="navbar-brand" href="#">网上购物</a>
    </div>

   
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" id="Search_goodsname" placeholder="Search">
        </div>
        <button type="button" class="btn btn-default" onclick="Search_goodsBygoodsname();">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="#" onclick="load('cloth')">衣物</a></li>
        <li><a href="#" >|</a></li>
        <li><a href="#" onclick="load('food')">食品</a></li>
         <li><a href="#">|</a></li>
        <li><a href="#" onclick="load('car')">车</a></li>
         <li><a href="#">|</a></li>
        <li><a href="#" onclick="load('it')">数码产品</a></li>      
	  </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#">欢迎，<span id="user_name">${sessionScope.user}</span></a></li>
        <li><a href="#" onclick="shopping_cart();">购物车</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的账户<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" data-toggle="modal" data-target="#myMessageModel" onclick="mymessage();">我的信息</a></li>
            <li><a href="#" onclick="myorder();">我的订单</a></li>
            <li><a href="#" onclick="back()">退出登录</a></li>       
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- 我的信息模态框 -->

 <div class="modal fade" id="myMessageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">账户编号:<span id="user_id"></span></h4>
      </div>
      <div class="modal-body">
       	<div class="row">
          <div class="col-md-6">
          		<label for="username">用户名</label>
		    	<input type="text" class="form-control" id="username" onchange="jy_username();">
		    	<span class="help-block"></span>
          </div>
           <div class="col-md-6">
           		<img src='../dill/img/22.jpg'>
       	   </div>
        </div>
        <div class="row">
         <div class="col-md-6">
          		<label for="password">密码</label>
		    	<input type="text" class="form-control" id="password" onchange="jy_password();">
		    	<span class="help-block"></span>
          </div>
          <div class="col-md-6">
          		<label for="realname">真实姓名</label>
		    	<input type="text" class="form-control" id="realname" onchange="jy_realname();">
		    	<span class="help-block"></span>
          </div>
         
        </div>
        <div class="row">
          <div class="col-md-6">
          		<label for="gender">性别</label>
		    	<select class="form-control" id="gender">
				  <option>男</option>
				  <option>女</option>			  
				 </select>
          </div>
          <div class="col-md-6">
          		<label for="age">年龄</label>
		    	<input type="text" class="form-control" id="age" onchange="jy_age();">
		    	<span class="help-block"></span>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
          		<label for="phone">电话</label>
		    	<input type="text" class="form-control" id="phone">
          </div>
          
        </div>
        <div class="row"> 
        <!-- 地址联动 
           <div class="col-md-6" style="margin:10px;">
           		<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td>
      			<select id="province" name="province" onchange="doProvAndCityRelation();">
  　　　　　　　　			<option id="choosePro" value="-1">请选择您所在省份</option>
  　　　　　　		</select>
    			</td></tr>
    			<tr><td><select id="citys" name="city" onchange="doCityAndCountyRelation();">
 　　　　　　　　		<option id='chooseCity' value='-1'>请选择您所在城市</option>
 　　　　　　		</select>
    			</td>
    			</tr>
    			<tr><td>
 				<select id="county" name="county">
 　　　　　　　　			<option id='chooseCounty' value='-1'>请选择您所在区/县</option>
　　　　　　		</select>
    			</td></tr>
				</table>
           		
           </div>
           -->
          <div class="col-md-6">
          		<label for="address">收货地址</label>
		    	<input type="text" class="form-control" id="address">
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
          		<label for="phone">用户账号类型</label>
		    	<span id="status" class="form-control"></span>
          </div>
         
        </div>
       		
       		
       		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save_userMseeage();">Save changes</button>
      </div>
    </div>
  </div>
</div>




<!-- ajax 加载页面 -->
<div id="ajaxload">








</div>
</body>

</html>