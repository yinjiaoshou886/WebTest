<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Sql.*" import="java.util.ArrayList" import="java.util.List"  %> 
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="otherResource/theicon.ico" >
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>系统效能评估软件系统</title>
	<link type="text/css" rel="stylesheet" href="layui/css/layui.css" media="all">
	<script src="layui/layui.all.js"></script>
	<style>
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    p{text-indent:2em} 
    body{
		background:#009688;
	}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin kit-layout-admin">
        <div class="layui-header layui-bg-black">
            <div class="layui-logo">
            	<i class="layui-icon" style="font-size: 20px; color: #009688;">&#xe62c;</i>系统效能评估软件系统
            </div>
            <ul class="layui-nav layui-layout-right kit-nav">
                <li class="layui-nav-item">
                	<a href="login.jsp"> 注销</a>
                </li>
            </ul>
        </div>

        <div class="layui-side layui-bg-cyan kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
               <!-- <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar> -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
				<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
					<li class="layui-nav-item layui-bg-cyan">
                        <a href="intro.jsp" data-url="" data-name="form" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span> 系统简介</span></a>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed layui-bg-cyan">
                        <a href="javascript:;" ></i><span> 指标体系管理</span></a>
                    	<dl class="layui-nav-child">
                            <dd><a href="showIndexSystem.jsp" kit-target data-options="{url:'',icon:'&#xe658;',title:'威胁度',id:'8'}"><i class="layui-icon">&#xe658;</i><span> 威胁度（目前只有这一个指标体系）</span></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed layui-bg-cyan">
                        <a href="javascript:;" data-url="" data-name="form" kit-loader><span> 评估</span></a>
                    	<dl class="layui-nav-child">
                            <dd><a href="showAlgorithm1.jsp" kit-target data-options="{url:'',icon:'&#xe658;',title:'分类',id:'8'}"><i class="layui-icon">&#xe658;</i><span> 算法</span></a></dd>
                            <dd><a href="showAlgorithm2.jsp" kit-target data-options="{url:'',icon:'&#xe658;',title:'回归',id:'9'}"><i class="layui-icon">&#xe658;</i><span> 算法</span></a></dd>
                            <dd><a href="showAlgorithm3.jsp" kit-target data-options="{url:'',icon:'&#xe658;',title:'随机过程',id:'10'}"><i class="layui-icon">&#xe658;</i><span> 还是算法</span></a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-body" id="container" >
            <!-- 内容主体区域  -->
            <div style="padding: 30px;">
            	<h2><a href="https://www.cnblogs.com/zhangchaoyang/articles/2591663.html">RBF神经网络算法</a></h2>
            	<p>神经网络算法，需要训练数据进行模型训练。模型训练结束后，根据模型，获得指标叶子层的节点值来计算指标顶层的值。</p>
            	<br>
            	<br>
            	<br>
            	<p>请上传训练用的数据(支持.xls，.xlsx格式)</p>
				<form action="UploadAG1Servlet" method="post" enctype="multipart/form-data">
					<input type="file" name="file1" ><br>
					<input type="submit">
				</form>
				<br>
            	<br>
            	<br>
				<p>请选择指标体系</p>
				<%
					Sql sql =  Sql.getInstance();
					ArrayList<String> al = sql.getTreeS();
					int num = al.size();
					String s;
				%>
				
				<form action="inputDataAG1.jsp" method="get" enctype="multipart/form-data">
				<table bgcolor="#DEDEDE" border="2" cellspacing="5" cellpadding="5" width="400">
					<thead>
						<tr>
							<th>序号</th>
							<th>指标体系</th>
							<th>.</th>
						</tr>
					</thead>
					<tbody>
<%
					for(int i=0;i<num;i++) {
%>
						<tr>
							<td><%= i%></td>
							<td><%=al.get(i).toString() %></td>
							<td><input type="radio" name="choose_target" value="<%= i%>"></td>
						</tr>
<%
					}
%>
						<tr>
							<td colspan="3"><input type="submit" value="提交"></td>
						</tr>
					</tbody>	
				</table>
				</form>
				
			</div>
        </div>
	    <div class="layui-footer layui-bg-black">
	        <!-- 底部固定区域 -->
	       	<font color="#009688" size="3px">样式来源：<a href="http://www.layui.com/">layui.com</a></font>
	    </div>
	</div>
    
    <script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	});
	</script>
</body>
</html>