<%@ page language="java" import="dbtaobao.connDb,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> list = connDb.index_4();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘宝双11数据分析</title>
<link href="./css/style.css" type='text/css' rel="stylesheet" />
<link rel="stylesheet" href="./css/layui.css">
<script type="text/javascript" src="./js/echarts.min.js"></script>
<script type="text/javascript" src="./js/china.js"></script>
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
		<li class="layui-nav-item layui-this"><a href="./index4.jsp">地图</a></li>
		<li class="layui-nav-item"><a href="./select.jsp">数据库展示</a></li>
		<li class="layui-nav-item"><a href="./relation.jsp">大数据预测分析</a></li>
	</ul>
	<div class="content">

		<div class="container">
			<div class="title" style="width:820px">各省份的总成交量对比</div>
			<div class="show">
				<div id="main" style="width: 800px; height: 400px;"></div>
			</div>
		</div>
	</div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts
				.init(document.getElementById('main'), 'halloween');
		//echarts.init(dom, 'chalk')
		function randomData() {
			return Math.round(Math.random() * 500);
		}
		var mydata = [ {
			name : '北京',
			value :
	<%=list.get(1)[1]%>
		}, {
			name : '天津',
			value :
	<%=list.get(23)[1]%>
		}, {
			name : '上海',
			value :
	<%=list.get(18)[1]%>
		}, {
			name : '重庆',
			value :
	<%=list.get(30)[1]%>
		}, {
			name : '河北',
			value :
	<%=list.get(33)[1]%>
		}, {
			name : '河南',
			value :
	<%=list.get(13)[1]%>
		}, {
			name : '云南',
			value :
	<%=list.get(21)[1]%>
		}, {
			name : '辽宁',
			value :
	<%=list.get(16)[1]%>
		}, {
			name : '黑龙江',
			value :
	<%=list.get(17)[1]%>
		}, {
			name : '湖南',
			value :
	<%=list.get(26)[1]%>
		}, {
			name : '安徽',
			value :
	<%=list.get(3)[1]%>
		}, {
			name : '山东',
			value :
	<%=list.get(4)[1]%>
		}, {
			name : '新疆',
			value :
	<%=list.get(9)[1]%>
		}, {
			name : '江苏',
			value :
	<%=list.get(15)[1]%>
		}, {
			name : '浙江',
			value :
	<%=list.get(32)[1]%>
		}, {
			name : '江西',
			value :
	<%=list.get(28)[1]%>
		}, {
			name : '湖北',
			value :
	<%=list.get(22)[1]%>
		}, {
			name : '广西',
			value :
	<%=list.get(7)[1]%>
		}, {
			name : '甘肃',
			value :
	<%=list.get(25)[1]%>
		}, {
			name : '山西',
			value :
	<%=list.get(10)[1]%>
		}, {
			name : '内蒙古',
			value :
	<%=list.get(31)[1]%>
		}, {
			name : '陕西',
			value :
	<%=list.get(2)[1]%>
		}, {
			name : '吉林',
			value :
	<%=list.get(27)[1]%>
		}, {
			name : '福建',
			value :
	<%=list.get(11)[1]%>
		}, {
			name : '贵州',
			value :
	<%=list.get(0)[1]%>
		}, {
			name : '广东',
			value :
	<%=list.get(6)[1]%>
		}, {
			name : '青海',
			value :
	<%=list.get(8)[1]%>
		}, {
			name : '西藏',
			value :
	<%=list.get(24)[1]%>
		}, {
			name : '四川',
			value :
	<%=list.get(19)[1]%>
		}, {
			name : '宁夏',
			value :
	<%=list.get(14)[1]%>
		}, {
			name : '海南',
			value :
	<%=list.get(5)[1]%>
		}, {
			name : '台湾',
			value :
	<%=list.get(29)[1]%>
		}, {
			name : '香港',
			value :
	<%=list.get(20)[1]%>
		}, {
			name : '澳门',
			value :
	<%=list.get(12)[1]%>
		} ];
		var optionMap = {
			backgroundColor : '#ffffff',
			title : {
				text : '全国地图大数据',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item'
			},

			//左侧小导航图标
			visualMap : {
				min : 2100,
				max : 2400,
				left : 'left',
				top : 'bottom',
				text : [ '高', '低' ], // 文本，默认为数值文本
				calculable : true
			},

			//配置属性
			series : [ {
				name : '数据',
				type : 'map',
				mapType : 'china',
				roam : true,
				label : {
					normal : {
						show : true
					//省份名称  
					},
					emphasis : {
						show : false
					}
				},
				data : mydata
			//数据
			} ]
		};
		//初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		//使用制定的配置项和数据显示图表
		myChart.setOption(optionMap);
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