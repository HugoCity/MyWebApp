<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>淘宝双11数据分析</title>
<link href="./css/style.css" type='text/css' rel="stylesheet" />
<link rel="stylesheet" href="./css/layui.css">
<script src="./js/echarts.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
th, tr, td, table {
	border: 1px solid red;
}
</style>
</head>


<body>
	<table class="layui-table">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>买家</th>
				
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
		<!-- <input type="text" value="" name="user_id">买家ID  -->
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


	<script src="./js/layui.js"></script>
	<script>
		//一般直接写在一个js文件中
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
		});
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;
		});
	</script>
</body>
</html>