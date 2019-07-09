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
			<div class="title">买家各个年龄段交易商品类型对比</div>
			<div class="show">

				<div id="main" style="width: 800px; height: 500px;"></div>
			</div>
		</div>
	</div>
	<script>
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据

var hours = ['[0,18]','[19,24]','[25,29]','[30,34]','[35,39]','[40,49]','[50,∞]','未知'];
var days = ['其他类','家电数码类','运动户外类','零食生鲜类','服装饰品类'];

var data = [[0,0,1008],[0,1,178],[0,2,125],[0,3,162],[0,4,561],[0,5,647],[0,6,521],[0,7,879],
            [1,0,559],[1,1,835],[1,2,655],[1,3,735],[1,4,775],[1,5,635],[1,6,543],[1,7,432],
            [2,0,375],[2,1,567],[2,2,875],[2,3,1123],[2,4,1545],[2,5,807],[2,6,903],[2,7,875],
            [3,0,1559],[3,1,1720],[3,2,2118],[3,3,2175],[3,4,1545],[3,5,2325],[3,6,2535],[3,7,1834],
            [4,0,2775],[4,1,3012],[4,2,2535],[4,3,2000],[4,4,1787],[4,5,1823],[4,6,1757],[4,7,2315],
            ];
option = {
    title: {
        text: '',
        link: 'https://github.com/pissang/echarts-next/graphs/punch-card'
    },
    legend: {
        data: ['不同年龄购买数'],
        left: 'right'
    },
    polar: {},
    tooltip: {
        formatter: function (params) {
            return params.value[2] + ' commits in ' + hours[params.value[1]] + ' of ' + days[params.value[0]];
        }
    },
    angleAxis: {
        type: 'category',
        data: hours,
        boundaryGap: false,
        splitLine: {
            show: true,
            lineStyle: {
                color: '#999',
                type: 'dashed'
            }
        },
        axisLine: {
            show: false
        }
    },
    radiusAxis: {
        type: 'category',
        data: days,
        axisLine: {
            show: false
        },
        axisLabel: {
            rotate: 45
        }
    },
    series: [{
        name: 'Punch Card',
        type: 'scatter',
        coordinateSystem: 'polar',
        symbolSize: function (val) {
            return val[2] /65;
        },
        data: data,
        animationDelay: function (idx) {
            return idx * 5;
        }
    }]
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