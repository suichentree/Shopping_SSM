<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物—后台管理系统</title>
<link href="../dill/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../dill/font-awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet">
<script src="../dill/jq/jquery.js"></script>
<script src="../dill/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>

<script>
	//默认管理页面，加载商品信息页面
	window.onload=function(){
		goodsmanager();
	} 
	
	
	//退出登陆
	function back_login(){
		window.location.href="http://localhost:8080/shopping_ssm/login.jsp"; 
		
	}		



   //用户管理函数
	function usermanager(){	
		$.ajax({
			type:"post",
			dataType:"json",  		
			url:"${pageContext.request.contextPath}/UserController/selectAlluser",		                                                   
			success: function(result){  
				
				
				$("#manager_load").load('${pageContext.request.contextPath}/jsp/user_message.jsp',function(){
					for(var i=0;i<result.length;i++){

						if(result[i].status===0){
							result[i].status="普通用户";
						}else if(result[i].status===1){
							result[i].status="VIP用户";
						}else{
							result[i].status="管理员用户";
						}
						
						$("#user_table").append("<tr><td>"+result[i].id+"</td><td>"+result[i].username+"</td><td>******</td>"+
								"<td>"+result[i].realname+"</td><td>"+result[i].gender+"</td><td>"+result[i].age+"</td>"+
								"<td>"+result[i].phone+"</td><td>"+result[i].address+"</td><td>"+result[i].status+"</td></tr>");		
					}
					
				});
				
			
			},
			error: function(){
				
				alert("usermanager() , error");
			}
			
		});	
	}


	//商品管理函数
	function goodsmanager(){	
		$.ajax({
			type:"post",
			dataType:"json",  		
			url:"${pageContext.request.contextPath}/GoodsController/selectAllGoods",		                                                   
			success: function(result){  			
				
				$("#manager_load").load('${pageContext.request.contextPath}/jsp/goods_message.jsp',function(){
					
					for(var i=0;i<result.length;i++){
						$("#goods_table").append("<tr name='goods_tr'><td>"+result[i].id+"</td><td>"+result[i].type+"</td>"+
								"<td>"+result[i].name+"</td><td>"+result[i].suitpeople+"</td><td>"+result[i].market_price+"</td>"+
								"<td>"+result[i].shop_price+"</td><td>"+result[i].createtime+"</td><td><a href='#' onclick='delete_goods(this)'>删除</a></td>"+
								"<td><a href='#' data-toggle='modal'  data-target='#goods_MessageModel' onclick='show_goods(this);'>修改</a></td></tr>");		
					}
					
				});
				
			
			},
			error: function(){				
				alert("goodsmanager() , error");
			}
			
		});	
	}
	
	
	
	//点击修改商品信息，弹出的模态框,用jax加载该商品的信息呈现在模态框中
	function show_goods(obj){
		var good_name=$(obj).parents().parents().children("td").eq(2).text();       //被选元素的父元素的父元素的  td 的子元素的第二个的文本值。
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${pageContext.request.contextPath}/GoodsController/selectGoodsByname",
			data:{"goods_name":good_name},
			success: function(result){
				
				document.getElementById("gid").innerHTML=result.id;                  //其他方式赋值
				document.getElementById("gname").value=result.name;					//给表单赋值
				document.getElementById("gtype").value=result.type;
				document.getElementById("gsuitpeople").value=result.suitpeople;
				document.getElementById("gmarket_price").value=result.market_price;
				document.getElementById("gshop_price").value=result.shop_price;
				document.getElementById("gcreatetime").value=result.createtime; 
				
			},
			error:function(){
				alert("show_goods(obj), error");
			}
			
		});
		
		
	}
	
	//修改商品模态框的保存按钮所点击的函数，把表单信息，用ajax 进行更新商品信息
 	function save_goods(){
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${pageContext.request.contextPath}/GoodsController/updateGoods",
			data:{"id":document.getElementById("gid").innerHTML,"name":document.getElementById("gname").value,
				"type":document.getElementById("gtype").value,"suitpeople":document.getElementById("gsuitpeople").value,
				"market_price":document.getElementById("gmarket_price").value,"shop_price":document.getElementById("gshop_price").value,
				"createtime":document.getElementById("gcreatetime").value},
			success:function(result){
				alert("修改商品信息成功！！！");
			
			
			},
			error:function(){
				alert("save_goods(),error");
			}
			
		});
	} 
	 
	
	function delete_goods(obj){
		var good_name1=$(obj).parents().parents().children("td").eq(2).text();           //获取被点击删除按钮所在行的商品id，与商品名称
		var good_id1=$(obj).parents().parents().children("td").eq(0).text();
		
		var a=confirm("是否删除商品 "+good_name1);
		if(a){	
			$.ajax({
				type:"post",
				dataType:"json",
				url:"${pageContext.request.contextPath}/GoodsController/deleteGoods",
				data:{"id":good_id1},
				success:function(){
					alert("删除商品信息成功！！！");
				
				},
				error:function(){
					alert("delete_goods(),error");
				}
				
			});
		}else{
			
			
		}
	}
	
	
	//增加商品模态框的保存按钮所点击的函数
 	function add_goods(){
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${pageContext.request.contextPath}/GoodsController/insertGoods",
			data:{"name":document.getElementById("add_gname").value,"type":document.getElementById("add_gtype").value,"suitpeople":document.getElementById("add_gsuitpeople").value,
				"market_price":document.getElementById("add_gmarket_price").value,"shop_price":document.getElementById("add_gshop_price").value,
				"createtime":document.getElementById("add_gcreatetime").value},
			success:function(result){
				alert("增加商品信息成功！！！");
			
			
			},
			error:function(){
				alert("add_goods(),error");
			}
			
		});
	} 
	
	//搜索框的查询商品
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
				}
				$("tr[name='goods_tr']").remove();                   //删除tr标签中name="goods_tr"的元素及其子元素
				
				
				$("#goods_table").append("<tr name='goods_tr'><td>"+result.id+"</td><td>"+result.type+"</td>"+
						"<td>"+result.name+"</td><td>"+result.suitpeople+"</td><td>"+result.market_price+"</td>"+
						"<td>"+result.shop_price+"</td><td>"+result.createtime+"</td><td><a href='#' onclick='delete_goods(this)'>删除</a></td>"+
						"<td><a href='#' data-toggle='modal'  data-target='#goods_MessageModel' onclick='show_goods(this);'>修改</a></td></tr>");		
					
					
					
			
				
				
				
			},
			error:function(){
				alert("Search_goodsBygoodsname(), error");
			}
			
		});
	}
	
</script>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">网上购物—后台管理系统</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" onclick="back_login();">退出登陆</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- 侧边栏 -->

 <!--左右测内容-->
    <div class="container-filued">
                <!-- 左侧菜单选项========================================= -->
                <div class="col-xs-3 col-md-2 ">        
                    <ul class="nav nav-sidebar">
						<li><a href="#userMeun" onclick="usermanager();" class="nav-header menu-first collapsed" data-toggle="collapse">
                           		用户管理 <span class="sr-only">(current)</span>
                            </a>
                        </li>   
            	        <li><a href="#deptmeun" onclick="goodsmanager();" class="nav-header menu-first collapsed" data-toggle="collapse">
                            	商品管理 <span class="sr-only">(current)</span>
                            </a>
                        </li> 
                    </ul>
                    
                </div>
                <!-- 右侧内容展示==================================================-->           
                <div class=" col-xs-9 col-md-10" id="manager_load">
                   	
              	</div> 
        </div>






</body>
</html>