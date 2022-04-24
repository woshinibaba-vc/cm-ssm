<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>申请维修信息</title>
	<%@include file="/common/head.jsp" %>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${basePath}/resources/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${basePath}/resources/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${basePath}/resources/vendor/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${basePath}/resources/vendor/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <style>
        .table tbody tr td{
            vertical-align: middle;
        }
        .table thead tr th{
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>

<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center;vertical-align:middle;">
                <img id="bigImg" src="" width="100%">
            </div>
            <div class="modal-footer">
                <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div style="padding:0px 10px;" class="brand">
                <h1>小区管理系统后台</h1>
            </div>
            <div class="container-fluid">
                <div class="navbar-btn">
                    <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
                </div>
                <div id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="" id="myhead" height="22px" class="img-circle">
                                <span>${admin.aname}</span>
                                <i class="icon-submenu lnr lnr-chevron-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${basePath}/admin/myworld"><i class="lnr lnr-user"></i> <span>我的主页</span></a>
                                </li>
                               <li><a href="${basePath}/admin/logout"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${basePath}/admin/index" class=""><i class="lnr lnr-home"></i> <span>后台桌面</span></a></li>
                        <li><a href="${basePath}/house/list" class=""><i class="lnr lnr-dice"></i> <span>楼房信息</span></a></li>
                        <li><a href="${basePath}/user/list" class=""><i class="lnr lnr-user"></i> <span>业主信息</span></a></li>
                        <li><a href="${basePath}/staff/list" class=""><i class="lnr lnr-user"></i> <span>停车场管理</span></a></li>
                        <li><a href="${basePath}/chargeitem/list" class=""><i class="lnr lnr-inbox"></i><span>收费项目</span></a></li>
                        <li><a href="${basePath}/payinfo/list" class=""><i class="lnr lnr-bookmark"></i> <span>缴欠费信息</span></a></li>
                        <li><a href="${basePath}/checkin/list" class=""><i class="lnr lnr-bookmark"></i> <span>访客登记列表</span></a>
						<li><a href="${basePath}/face/list" class="active"><i class="lnr lnr-pencil"></i> <span>门禁使用记录</span></a></li>
						<li><a href="${basePath}/dorepair/list" class=""><i class="lnr lnr-enter"></i> <span>维修信息处理</span></a></li>
						<li><a href="${basePath}/moving/list" class=""><i class="lnr lnr-heart"></i> <span>小区动态信息</span></a></li>
                        <li><a href="${basePath}/moving/list" class=""><i class="lnr lnr-heart"></i> <span>小区报表</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
				<h3 class="page-title">门禁使用记录</h3>
					<%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">

        </div>
    </div>
    <%--信息--%>
    <div class="row">
        <div class="col-md-12">
            <table style="text-align: center;" class="table table-hover table-striped table-bordered" id="emps_table">
                <thead>
                    <tr>
                        <th>进门图片</th>
                        <th>业主编号</th>
                        <th>业主姓名</th>
	                    <th>门禁使用时间</th>
	                    <th>操作</th>
                    </tr>
                </thead>
                <tbody style="vertical-align: middle">
                </tbody>
            </table>

        </div>
    </div>
				            
					
				</div>
	<%--分页条--%>
    <div class="row">
        <div style="position: fixed;top:93%;left:500px;font-size: 15px;" class="col-md-6" id="page_inf">

        </div>
        <div style="position: fixed;top:89%;left:800px;font-size: 15px;" class="col-md-6" >
            <nav aria-label="Page navigation">
                <ul class="pagination" id="navUl">
                </ul>
            </nav>
        </div>
    </div>
			</div>
			
			<!-- END MAIN CONTENT -->
		</div>
	
		<!-- END MAIN -->
		<div class="clearfix"></div>
		
		<footer>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="${basePath}/resources/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${basePath}/resources/vendor/klorofil-common.js"></script>
	<script>
	// 当前页面
    var curPage;

    $(function () {
//        发送ajax请求
       to_page(1);
    });

    /**
     *  跳转到某个页面
    */
     function to_page(pn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/face/faceList",
            data:"pn=" + pn,
            type:"GET",
            success:function (result) {
                console.log(result);
                build_emps_table(result);
//                显示分页信息
                build_page_nav(result);
            }
        });
    }
    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
        h = (date.getHours() < 10 ? '0'+date.getHours() : date.getHours()) + ':';
        m = (date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes()) + ':';
        s = date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds();
        return Y+M+D+h+m+s;
    }
    /**
     * 信息的显示
     * @param result 服务器返回的json数据
     */
    function build_emps_table(result) {
        // 先清空上一次的内容
        $("#emps_table tbody").empty();

        // 拿到json中的员工列表
        var faces = result.list;

        //jQuery提供的遍历方法,回调函数：索引和每一项信息
        $.each(faces, function (index, item) {

            var face_token = $("<td></td>")
                .append("<img src='/face/"+item.face_token+".png' height='80px'>");
            var uid = $("<td></td>").append(item.user.uid);
            var uname = $("<td></td>").append(item.user.uname);
            var time = $("<td></td>").append(timestampToTime(item.time));

            var lookBtn = $("<td></td>").append($("<button></button>").addClass("btn btn-success")
                .append($("<span></span>").addClass("glyphicon glyphicon-resize-full"))
                .append("查看大图").click(function (){
                    //按钮删除事件
                    lookBtnClick(item.face_token);
                }));

            var tr = $("<tr></tr>").append(face_token)
                .append(uid)
                .append(uname)
                .append(time)
                .append(lookBtn);

            $("#emps_table tbody").append(tr);
        });
    }

    /**
     * 分页信息的显示
     * @param result 服务器返回的json数据
     */
    function build_page_nav(result) {
        // 先清空
        $("#page_inf").empty();
        $("#navUl").empty();
        var pageInfo = result;
        curPage = pageInfo.pageNum;
        // 添加左侧页数信息
        $("#page_inf").append("当前" + pageInfo.pageNum +
            "页,总" + pageInfo.pages +
            "页,总"+pageInfo.total +
            "记录");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var nextPageLI = $("<li></li>").append($("<a></a>").append("&raquo;"));

        $("#navUl").append(firstPageLi);
        $("#navUl").append(prePageLi);

        // 添加首页导航
        // 只有当不是第一页时显示
        if (pageInfo.pageNum == 1) {
            firstPageLi.addClass("disabled");
        }
        if (!pageInfo.hasPreviousPage) {
            prePageLi.addClass("disabled");
        } else {
            prePageLi.click(function () {
                to_page(pageInfo.pageNum - 1);
            });
        }

        var navNums = pageInfo.navigatepageNums;
        // 遍历当前显示页数
        $.each(navNums, function (index, item) {
            var li = $("<li></li>").append($("<a></a>").append(item))
                .click(function () {
                    to_page(item);
                });
            if (item == pageInfo.pageNum) {
                li.addClass("active");
            }
            $("#navUl").append(li);
        });

        $("#navUl").append(nextPageLI);
        $("#navUl").append(lastPageLi);
        if (!pageInfo.hasNextPage) {
            nextPageLI.addClass("disabled");
        } else {
            nextPageLI.click(function () {
                to_page(pageInfo.pageNum + 1);
            });
        }
        // 添加末页导航
        if (pageInfo.pageNum == pageInfo.pages) {
            lastPageLi.addClass("disabled");
        }
        firstPageLi.click(function () {
            to_page(1);
        });
        lastPageLi.click(function () {
            to_page(pageInfo.pages);
        });
    }
    $("#addBtn").click(function () {
//        先清空表单信息,调用dom对象的重置方法
        $("#empAddModal form")[0].reset();
        // 发送ajax请求获得部门信息
        /* getDeptMessage("#empAddModal select"); */
        // 弹出模态对话框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    $("#closeBtn").click(function (){
        $("#myModal").modal("hide");
        $("#bigImg").attr("src","");
    })

    function lookBtnClick(uuid){
        $("#bigImg").attr("src","/face/"+uuid+".png");
        $("#myModal").modal("show");
    }

	</script>
</body>

</html>