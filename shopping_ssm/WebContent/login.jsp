<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上购物系统-登陆/注册</title>
<link rel="stylesheet" href="../dill/font-awesome-4.7.0/css/font-awesome.min.css">
<link href="dill/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="dill/jq/jquery.js"></script>
<script src="dill/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>

<!-- 当点击注册，登录按钮是，清除模态框的数据 -->
<script type="text/javascript">
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


//对注册时输入的数据进行校验
function jy_zhuce(){

	//对用户名进行校验
	var username=$("#inputUsername").val();
	var regName=/(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;        //用户名6-16位或中文2-5位
	
	
	if(!regName.test(username)){
		
		jy("#inputUsername","error","用户名格式不正确,必须是字母或数字6-16位或中文2-5位");
		return false;
		
	}else{
		jy("#inputUsername","success","");
		
		//对密码进行校验
		var password=$("#inputPassword").val();
		var regPassword=/^[a-z0-9_-]{4,18}$/;
		
		if(!regPassword.test(password)){
			jy("#inputPassword","error","密码是6-18位");
			return false;
		}else{
			jy("#inputPassword","success","");
			
			//对手机电话进行校验
			var phone=$("#inputPhone").val();
			var regphone=/^[1][3,5,8][0-9]{9}$/;
			if(regphone.test(phone)){
				jy("#inputPhone","success","");
				return true;
				
			}else{
				jy("#inputPhone","error","电话是13/15/18+9位数字");
				return false;
				
			}
		}
	}
}


//对登录时输入的数据进行校验
function jy_login(){

	//对用户名进行校验
	var username=$("#inputUsername2").val();
	var regName=/(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;        //用户名6-16位或中文2-5位
	
	
	if(!regName.test(username)){
		
		jy("#inputUsername2","error","用户名格式不正确,必须是字母或数字5-16位或中文2-5位");
		return false;
		
	}else{
		jy("#inputUsername2","success","");
		
		//对密码进行校验
		var password=$("#inputPassword2").val();
		var regPassword=/^[a-z0-9_-]{4,18}$/;
		
		if(!regPassword.test(password)){
			jy("#inputPassword2","error","密码是6-18位");
			return false;
		}else{
			jy("#inputPassword2","success","");
			return true;
			
		}
	}
}

//通过ajax，查看用户名是否可用
function jy_username(){
	
	var username=$("#inputUsername").val();
	
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/UserController/selectUserByusername",
		data:{"username":username},
		success:function(result){
			$("#inputUsername").parent().removeClass("has-error has-success");
			$("#inputUsername").next("span").text("");
			
			if(result!=null){
				alert("用户名不可用");
				jy("#inputUsername","error","用户名不可用");
			}
		},
		error:function(){
			alert("通过ajax，查看用户名是否可用, error");
		}
		
		
		
		
	});
	
	
}

//通过ajax，查看用户名是否可用
function jy_login_username(){
	
	var username=$("#inputUsername2").val();
	
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/UserController/selectUserByusername",
		data:{"username":username},
		success:function(result){
			$("#inputUsername2").parent().removeClass("has-error has-success");
			$("#inputUsername2").next("span").text("");
			
			if(result==null){
				alert("用户名不可用");
				jy("#inputUsername2","error","用户名不可用");
			}
		},
		error:function(){
			alert("通过ajax，查看用户名是否可用, error");
		}
		
		
		
		
	});
	
	
}


//通过ajax，查看电话是否可用
function jy_phone(){
	
	var phone=$("#inputPhone").val();
	
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${pageContext.request.contextPath}/UserController/selectUser",
		data:{"phone":phone},
		success:function(result){
			$("#inputPhone").parent().removeClass("has-error has-success");
			$("#inputPhone").next("span").text("");
			
			if(result!=null){
				alert("电话不可用");
				jy("#inputPhone","error","电话不可用");
			}
		},
		error:function(){
			alert("通过ajax，查看电话是否可用, error");
		}
			
	});
	
	
}


</script>



</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-default" style="margin-bottom:0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">网上购物</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" data-toggle="modal" data-target="#zhuce" name="zhuce" >注册 </a></li>
        <li><a href="#" data-toggle="modal" data-target="#delu" name="delu">登录</a></li>
        
      </ul>
    </div>
  </div>
</nav>



<!-- 注册模态框 -->

<div class="modal fade" id="zhuce" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">注册</h4>
      </div>
      <form class="form-horizontal" action="UserController/zhuce" method="post"  autocomplete="off" onsubmit="return jy_zhuce();">     <!-- autocomplete="off" 禁止让浏览器自动记录之前输入的值 -->
      <div class="modal-body">
		 <div class="form-group">
		    <label for="inputUsername" class="col-sm-2 control-label">username</label>
		    <div class="col-sm-10">
		      <input type="text" name="username" class="form-control" id="inputUsername" placeholder="username" onchange="jy_username()">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
		     <span class="help-block"></span>
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="inputPhone" class="col-sm-2 control-label">Phone</label>
		    <div class="col-sm-10">
		      <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="Phone"  onchange="jy_phone()">
		    	 <span class="help-block"></span>
		    </div>
		  </div>
		
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
         <input type="submit" class="btn btn-primary" value="确定" id="click_zhuce"/>
      </div>
      
      </form>
    </div>
  </div>
</div>




<!-- 登录模态框 -->
<div class="modal fade" id="delu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">登录</h4>
      </div>
      <form class="form-horizontal" action="UserController/login" method="post" id="deluform"  autocomplete="off" onsubmit="jy_login();">    <!-- autocomplete="off" 禁止让浏览器自动记录之前输入的值 -->
      <div class="modal-body">
       
		  <div class="form-group">
		    <label for="inputUsername2" class="col-sm-2 control-label">username</label>
		    <div class="col-sm-10">
		      <input type="text" name="username" class="form-control" id="inputUsername2" placeholder="username" onchange="jy_login_username();">
		    	<span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword2" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" name="password" class="form-control" id="inputPassword2" placeholder="Password">
		    	<span class="help-block"></span>
		    </div>
		  </div>
		  
	</div>
	 <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <input type="submit" class="btn btn-primary" id="login" value="确定"/>
      </div>
    </form>
    </div>
  </div>
</div>

<!--详情信息模态框-->
<div class="modal fade" id="more_message" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div role="tabpanel" class="tab-pane" id="profile2">
            <div class="modal-body" style="text-align:center;">
                  <p>开发者：束永祥</p>
                  <p>当前版本： v1.0.0</p>
                  <p>创建日期: 2017-10-26</p>
            </div>
        </div>
    </div>
  </div>
</div>


<!-- 巨幕 -->

<div class="jumbotron">
<div class="container">
  <h1>欢迎使用网上购物!</h1>
  <p>制作人：束永祥</p>
  <p><a class="btn btn-primary btn-lg" href="#" data-toggle="modal" data-target="#more_message" role="button">了解更多！！！</a></p>
</div>
</div>


</body>
</html>