<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/style.css" type='text/css' rel="stylesheet" />
<link rel="stylesheet" href="./css/layui.css">
<link rel="stylesheet" href="./css/modules/layer/default/layer.css">
<script src="./js/echarts.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
th, tr, td, table {
	border: 1px solid red;
}
</style>
<title>查询系统</title>
</head>
<body>

	<ul class="layui-nav " lay-filter="">


		<li class="layui-nav-item "><a href="javascript:;">饼图</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index.jsp">买家消费</a>
				</dd>
				<dd>
					<a href="./index1.jsp">买家交易</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item "><a href="javascript:;">散点图</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index2.jsp">男女各年龄购买</a>
				</dd>
				<dd>
					<a href="index6.jsp">各年龄类型</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item "><a href="javascript:;">分析图</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index3.jsp">柱状分析</a>
				</dd>
				<dd>
					<a href="index5.jsp">折线堆积</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="./index4.jsp">地图</a></li>
		<li class="layui-nav-item layui-this"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>
	<div class="content">
		<div class="container">
			<div class="title" style="width:830px">数据库显示</div>

		</div>
	</div>


	<!-- ********************** -->

	<div class=place>
		<table>
			<form action="FirstSql">

				<div class="layui-form-item">

					<label class="layui-form-label" style="width: 10px;">月 </label>
					<div class="layui-input-inline">
						<input type="text" name="month" placeholder="请输入"
							autocomplete="off" class="layui-input">
					</div>

					<label class="layui-form-label">买家ID </label>
					<div class="layui-input-inline">
						<input type="text" name="user_id" placeholder="请输入"
							autocomplete="off" class="layui-input">
					</div>
					<label class="layui-form-label">年龄段 </label>
					<div class="layui-input-inline">
						<input type="text" name="age_range" placeholder="请输入"
							autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 10px;">日 </label>
					<div class="layui-input-inline">
						<input type="text" name="day" placeholder="请输入" autocomplete="off"
							class="layui-input">
					</div>


					<label class="layui-form-label">用户行为</label>
					<div class="layui-input-inline">
						<select name="action" lay-filter="aihao"
							style="width: 190px; height: 38px">
							<option value="" selected>请选择</option>
							<option value="0">点击</option>
							<option value="1">加入购物车</option>
							<option value="2">购买</option>
							<option value="3">关注商品</option>
						</select>

					</div>
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<select name="gender" lay-filter="aihao"
							style="width: 190px; height: 38px">
							<option value="" selected>全选</option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select>

					</div>
				</div>

				<div class="layui-form-item">


					<div class="layui-input-in">
						<button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>

				<!-- ************ -->
				<input type="hidden" name="province" placeholder="请输入"
					autocomplete="off" class="layui-input"> <input
					type="hidden" value="" name="item_id"> <input type="hidden"
					value="" name="cat_id"> <input type="hidden" value=""
					name="merchant_id"> <input type="hidden" value=""
					name="brand_id">
				<!-- ************** -->
			</form>
		</table>
	</div>

	<!-- ************************* -->
	<!-- 显示查询到的数据 -->
	<table class="layui-table" lay-filter="select">

		<thead>
			<tr>
				<th lay-data="{field:'username', width:100}">买家</th>

				<th>商品</th>
				<th>商品类别</th>
				<th>卖家</th>
				<th>商标</th>
				<th>月</th>
				<th>日</th>
				<th>行为</th>
				<th>年龄段</th>
				<th>性别</th>
				<th>省份</th>

			</tr>
		</thead>
		<tbody>
			<tr>

			</tr>
			<c:forEach items="${key_list}" var="usr" varStatus="idx">
				<tr>
					<td>${usr.user_id}</td>

					<td>${usr.item_id}</td>
					<td>${usr.cat_id}</td>
					<td>${usr.merchant_id}</td>
					<td>${usr.brand_id}</td>

					<td>${usr.month}</td>
					<td>${usr.day}</td>
					<td>${usr.action}</td>
					<td>${usr.age_range}</td>
					<td>${usr.gender}</td>
					<td>${usr.province}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script src="layer.js"></script>
	<script src="./js/layui.js"></script>
	<script>
		//一般直接写在一个js文件中
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
			var laydate = layui.laydate //日期
			, laypage = layui.laypage //分页
			, layer = layui.layer //弹层
			, table = layui.table //表格
			, carousel = layui.carousel //轮播
			, upload = layui.upload //上传
			, element = layui.element //元素操作
			, slider = layui.slider;//滑块

		});
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;
		});

		//表单修饰
		layui.use('form', function() {
			var form = layui.form;

			//各种基于事件的操作，下面会有进一步介绍
		});
	</script>

</body>
</html>