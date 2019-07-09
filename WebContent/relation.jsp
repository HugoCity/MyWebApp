<%@ page language="java" import="dbtaobao.connDb,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> list = connDb.relation();
%>
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
					<a href="./index1.jsp">买家交易</a>
				</dd>
			</dl></li> 交易
		</a>
		</li>
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
		<li class="layui-nav-item "><a href="./index4.jsp">地图</a></li>
		<li class="layui-nav-item"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item layui-this"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>
	<div class="content">

		<div class="container">
			<div class="title" style="width:800px">回头客预测分数与回头率对比</div>
			<div class="" style="width: 1200px">
				<div id="main"
					style="width: 500px; height: 400px; float: left; margin-left: 50px"></div>
				<div id="main2"
					style="width: 500px; height: 400px; float: left; margin-top: 80px"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var data = [];
		for (var i = 1; i < 5000; i++) {
			data.push(i / 50);
		}

		var x = []
	<%for (String[] a : list) {%>
		x.push(
	<%=a[0]%>
		);
	<%}%>
		option = {
			color : [ '#FF0000' ],
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : data

			} ],
			yAxis : [ {
				type : 'value',

			} ],
			series : [ {
				type : 'line',
				smooth : true,
				symbol : 'none',
				sampling : 'average',
				type : 'line',
				data : x
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>

	<!--  **************************************************** -->
	<script type="text/javascript">
		var myChart2 = echarts.init(document.getElementById('main2'));

		option2 = {
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b}: {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : [ '回头率 1%', '回头率 20%', '回头率 40%', '回头率 60%', '回头率 80%',
						'回头率 99%' ]
			},
			series : [ {
				name : '回头人数',
				type : 'pie',
				radius : [ '50%', '70%' ],
				avoidLabelOverlap : false,
				label : {
					normal : {
						show : false,
						position : 'center'
					},
					emphasis : {
						show : true,
						textStyle : {
							fontSize : '30',
							fontWeight : 'bold'
						}
					}
				},
				labelLine : {
					normal : {
						show : false
					}
				},
				data : [ {
					value : 6031,
					name : '回头率 1%'
				}, {
					value : 12883,
					name : '回头率 20%'
				}, {
					value : 18203,
					name : '回头率 40%'
				}, {
					value : 17272,
					name : '回头率 60%'
				}, {
					value : 8236,
					name : '回头率 80%'
				}, {
					value : 4275,
					name : '回头率 99%'
				} ]
			} ]
		};

		myChart2.setOption(option2);
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