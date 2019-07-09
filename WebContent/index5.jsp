<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘宝双11数据分析</title>
<link href="./css/style.css" type='text/css' rel="stylesheet" />
<link rel="stylesheet" href="./css/layui.css">
<script src="./js/echarts.min.js"></script>
</head>
<body>
	<ul class="layui-nav" lay-filter="">
		<li class="layui-nav-item "><a href="javascript:;">饼图</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index.jsp">买家消费</a>
				</dd>
				<dd>
					<a href="index1.jsp">买家交易</a>
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
		<li class="layui-nav-item layui-this"><a href="javascript:;">分析图</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index3.jsp">柱状分析</a>
				</dd>
				<dd>
					<a href="index5.jsp">折线堆积</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="./index4.jsp">地图</a></li>
		<li class="layui-nav-item"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>


	<div class="content">

		<div class="container">
			<div class="title">各类商品的点击率随时间变化关系</div>
			<div class="show">

				<div id="main" style="width: 800px; height: 400px;"></div>
			</div>
		</div>
	</div>

	<!-- 	****************************** -->

	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		option = {
			title : {
				text : '点击量总数'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '其他类', '家电数码类', '运动户外类', '零食生鲜类', '服装饰品类' ]
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '五月', '六月', '七月', '八月', '九月', '十月', '十一月' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '其他类',
				type : 'line',
				stack : '总量',
				data : [ 1023, 3320, 7899, 8103, 5202, 4430, 9002 ]
			}, {
				name : '家电数码类',
				type : 'line',
				stack : '总量',
				data : [ 2200, 3820, 5010, 2340, 2900, 3300, 10100 ]
			}, {
				name : '运动户外类',
				type : 'line',
				stack : '总量',
				data : [ 3500, 6302, 7901, 4504, 5090, 6300, 21000 ]
			}, {
				name : '零食生鲜类',
				type : 'line',
				stack : '总量',
				data : [ 4000, 6302, 8010, 3340, 3900, 3300, 23200 ]
			}, {
				name : '服装饰品类',
				type : 'line',
				stack : '总量',
				data : [ 6200, 10302, 12001, 9304, 12090, 13030, 28020 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>



	<script src="./js/layui.js"></script>
	<script>
		//一般直接写在一个js文件中
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
		});
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;

			//…
		});
	</script>

</body>
</html>