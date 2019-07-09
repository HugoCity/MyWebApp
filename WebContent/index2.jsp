<%@ page language="java" import="dbtaobao.connDb,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> list = connDb.index_2();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			</dl></li>
		<li class="layui-nav-item layui-this"><a href="javascript:;">散点图</a>
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
		<li class="layui-nav-item"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>
	<div class="content">

		<div class="container">
			<div class="title" style="width:780px">男女买家各个年龄段交易对比</div>
			<div class="show">

				<div id="main" style="width: 780px; height: 400px;"></div>
			</div>
		</div>
	</div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var data = [];
		data[0] = [];
		data[1] = [];
	<%for (String[] a : list) {
				if (a[0].equals("0")) {%>
		data[0].push([
	<%=a[1]%>
		,
	<%=a[2]%>
		]);
	<%} else if (a[0].equals("1")) {%>
		data[1].push([
	<%=a[1]%>
		,
	<%=a[2]%>
		]);
	<%}
			}%>
		option = {
			backgroundColor : new echarts.graphic.RadialGradient(0.3, 0.3, 0.8,
					[ {
						offset : 0,
						color : '#f7f8fa'
					}, {
						offset : 1,
						color : '#cdd0d5'
					} ]),

			legend : {
				right : 10,
				data : [ 'women', 'men' ]
			},
			xAxis : {
				show:true,
		    	name:'age',
		    	data:['[0,18]','[19,24]','[25,29]','[30,34]','[35,39]','[40,49]','[50,∞]','未知'],
				splitLine : {
					lineStyle : {
						type : 'dashed'
						
					}
				}
			},
			yAxis : {
				
				splitLine : {
					lineStyle : {
						type : 'dashed'
					}
				},
				scale : true
			},
			series : [
					{
						name : 'women',
						data : data[0],
						type : 'scatter',
						symbolSize : function(data) {
							return 10;
						},
						label : {
							emphasis : {
								show : true,
								formatter : function(param) {
									return param.data[3];
								},
								position : 'top'
							}
						},
						itemStyle : {
							normal : {
								shadowBlur : 10,
								shadowColor : 'rgba(120, 36, 50, 0.5)',
								shadowOffsetY : 5,
								color : new echarts.graphic.RadialGradient(0.4,
										0.3, 1, [ {
											offset : 0,
											color : 'rgb(251, 118, 123)'
										}, {
											offset : 1,
											color : 'rgb(204, 46, 72)'
										} ])
							}
						}
					},
					{
						name : 'men',
						data : data[1],
						type : 'scatter',
						symbolSize : function(data) {
							return 10;
						},
						label : {
							emphasis : {
								show : true,
								formatter : function(param) {
									return param.data[3];
								},
								position : 'top'
							}
						},
						itemStyle : {
							normal : {
								shadowBlur : 10,
								shadowColor : 'rgba(25, 100, 150, 0.5)',
								shadowOffsetY : 5,
								color : new echarts.graphic.RadialGradient(0.4,
										0.3, 1, [ {
											offset : 0,
											color : 'rgb(129, 227, 238)'
										}, {
											offset : 1,
											color : 'rgb(25, 183, 207)'
										} ])
							}
						}
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