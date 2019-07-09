<%@ page language="java" import="dbtaobao.connDb,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> list = connDb.index_1();
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
		<li class="layui-nav-item layui-this"><a href="javascript:;">饼图</a>
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
		<li class="layui-nav-item"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>
	<div class="content">

		<div class="container">
			<div class="title" style="width:780px">男女买家交易对比</div>
			<div class="show">
				<div id="pie" style="width: 800px; height: 400px;">
					<div id="main" style="width: 800px; height: 400px;"></div>
				</div>
			</div>
		</div>
		<script>
			function drawPie(container, legendData, seriesData) {
				var pieChart = echarts.init(document.getElementById(container));
				pieChartOption = {
					backgroundColor : '#2c343c',
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},
					legend : {
						show : true,
						type : 'scroll',
						orient : 'horizontal',
						left : 120,
						top : 20,
						bottom : 20,
						data : legendData,
						textStyle : {
							color : 'white'
						}
					},
					//设置饼状图每个颜色块的颜色
					color : [ '#00FFFF', '#FF00FF', '#CDAF95' ],
					series : [ {
						name : '消费行为',
						type : 'pie',
						radius : '55%',
						center : [ '53%', '50%' ],
						label : {
							normal : {
								//饼形图显示格式
								formatter : '{b|{b}}  {per|{d}%}  ',
								rich : {
									b : {
										color : 'white',
										fontSize : 14,
										lineHeight : 33
									},
									//设置百分比数字颜色
									per : {
										color : '#00B4FB',
										fontSize : 14,
										padding : [ 2, 4 ],
										borderRadius : 2
									}
								}
							}
						},
						data : seriesData,
						itemStyle : {
							emphasis : {
								shadowBlur : 10,
								shadowOffsetX : 0,
								shadowColor : 'rgba(0, 0, 0, 0.5)'
							}
						}
					} ]
				};
				pieChart.setOption(pieChartOption);
				var app = {};
				app.currentIndex = -1;
				var myTimer = setInterval(
						function() {
							var dataLen = pieChartOption.series[0].data.length;
							if ((app.currentIndex < dataLen - 1)
									&& pieChartOption.series[0].data[app.currentIndex + 1].value == 0) {
								pieChart.dispatchAction({
									type : 'downplay',
									seriesIndex : 0,
									dataIndex : app.currentIndex
								});
								app.currentIndex = (app.currentIndex + 1)
										% dataLen;
							} else {
								// 取消之前高亮的图形
								pieChart.dispatchAction({
									type : 'downplay',
									seriesIndex : 0,
									dataIndex : app.currentIndex
								});
								app.currentIndex = (app.currentIndex + 1)
										% dataLen;
								// 高亮当前图形
								pieChart.dispatchAction({
									type : 'highlight',
									seriesIndex : 0,
									dataIndex : app.currentIndex
								});
								// 显示 tooltip
								pieChart.dispatchAction({
									type : 'dontshowTip',
									seriesIndex : 0,
									dataIndex : app.currentIndex
								});
							}
						}, 3000);
			}
			var legendData = [ "男性", "女性", "未知" ];
			var seriesData = [ {
				name : "男性",
				value :
		<%=list.get(0)[1]%>
			}, {
				name : "女性",
				value :
		<%=list.get(1)[1]%>
			}, {
				name : "未知",
				value :
		<%=list.get(2)[1]%>
			}, ];
			drawPie("pie", legendData, seriesData);
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