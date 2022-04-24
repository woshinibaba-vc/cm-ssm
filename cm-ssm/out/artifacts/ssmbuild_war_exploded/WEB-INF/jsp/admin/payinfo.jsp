<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>缴欠费信息</title>
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

</head>

<body>
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
                                <%--<li><a href="#"><i class="lnr lnr-envelope"></i> <span>消息</span></a></li>
                                <li><a href="#"><i class="lnr lnr-cog"></i> <span>设置</span></a></li>--%>
                                <li><a href="${basePath}/admin/logout"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
                            </ul>
                        </li>
                        <!-- <li>
                            <a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
                        </li> -->
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
                        <li><a href="${basePath}/garage/list" class=""><i class="lnr lnr-user"></i> <span>停车场管理</span></a></li>
                        <li><a href="${basePath}/chargeitem/list" class=""><i class="lnr lnr-inbox"></i><span>收费项目</span></a></li>
                        <li><a href="${basePath}/payinfo/list" class="active"><i class="lnr lnr-bookmark"></i> <span>缴欠费信息</span></a></li>
                        <li><a href="${basePath}/checkin/list" class=""><i class="lnr lnr-bookmark"></i> <span>访客登记列表</span></a>
                        <li><a href="${basePath}/face/list" class=""><i class="lnr lnr-pencil"></i> <span>门禁使用记录</span></a></li>
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
			<!-- 员工修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" required aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                	<div class="form-group">
                        <label for="pid_update_label" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="pid_update_label" required name="pid"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                            <label for="pcode_update_input" class="col-sm-2 control-label">欠费编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="pcode" class="form-control" required id="pcode_update_input" placeholder="请输入这栋楼的名字">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                        <label for="pmoney_update_input" class="col-sm-2 control-label">缴纳费用</label>
                            <div class="col-sm-10">
                                <input type="text" name="pmoney" class="form-control" required id="pmoney_update_input" placeholder="请输入这栋楼的位置">
                                <span class="help-block"></span>
                            </div>
                    </div>
                        <div class="form-group">
                            <label for="pinfo_update_input" class="col-sm-2 control-label">欠费信息</label>
                            <div class="col-sm-10">
                                <input type="text" name="pinfo" class="form-control" required id="pinfo_update_input" placeholder="请输入这栋楼的占地面积">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pstatus_update_input" class="col-sm-2 control-label">欠费状态</label>
                            <div style="margin-top: 10px" class="col-sm-10" id="pstatus_update_input">
                                已收取<input type="radio" name="pstatus"  value="已收取">&nbsp;&nbsp;&nbsp;&nbsp;
                                未收取<input type="radio" name="pstatus"  value="未收取">
                                <span class="help-block"></span>
                            </div>
                        </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_save_button">保存</button>
            </div>
        </div>
    </div>
</div>

    <!-- 员工新增模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="pcode_add_input" class="col-sm-2 control-label">欠费信息编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="pcode" class="form-control" id="pcode_add_input" required placeholder="请输入欠费信息编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ptime_add_input" class="col-sm-2 control-label">欠费时间</label>
                            <div class="col-sm-10">
                                <input type="date" name="ptime" class="form-control" required id="ptime_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pmoney_add_input" class="col-sm-2 control-label">缴收费用</label>
                            <div class="col-sm-10">
                                <input type="text" name="pmoney" class="form-control" id="pmoney_add_input" required placeholder="请输入缴收费用">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pinfo_add_input" class="col-sm-2 control-label">缴欠费信息</label>
                            <div class="col-sm-10">
                                <input type="text" name="pinfo" class="form-control" id="pinfo_add_input" required placeholder="请输入缴欠费信息">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cid_add_input" class="col-sm-2 control-label">费用编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="cid" class="form-control" id="cid_add_input" required placeholder="请输入费用编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="uid_add_input" class="col-sm-2 control-label">业主编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="uid" class="form-control" id="uid_add_input" required placeholder="请输入业主编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="add_save_button">保存</button>
                </div>
            </div>
        </div>
    </div>
			
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
				<h3 class="page-title">缴欠费信息列表</h3>
					<%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn-primary" id="addBtn">新增</button>
            <button class="btn-danger" id="batchDeleteBtn">批量删除</button>
        </div>
    </div>
    <%--信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="all_check_box"/></th>
                        <th>id</th>
                        <th>缴欠费编号</th>
	                    <th>缴欠费时间</th>
	                    <th>缴收费用</th>
	                    <th>缴欠费信息</th>
	                    <th>缴欠费状态</th>
				        <th>收费名称</th>
	                    <th>业主姓名</th>
	                    <th>操作</th>
                    </tr>
                </thead>
                <tbody>
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
            url:"${basePath}/payinfo/listAll",
            data:"pn=" + pn,
            type:"GET",
            success:function (result) {
                build_emps_table(result);
                // 显示分页信息
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
        var emps = result.list;

//            jQuery提供的遍历方法,回调函数：索引和每一项信息
        $.each(emps, function (index, item) {
        	
        	
            var checkBox = $("<td></td>").append($("<input type='checkbox' class='check_box'>"));
            var idTd = $("<td></td>").append(item.pid);
            var nameTd = $("<td></td>").append(item.pcode);
            var time = timestampToTime(item.ptime);
            var genderTd = $("<td></td>").append(time);
            var pmoney = $("<td></td>").append(item.pmoney);
            var emailTd = $("<td></td>").append(item.pinfo);
            var departmentTd;
            if (item.pstatus == "已收取") {
                departmentTd = $("<td><span class='label label-success'>" + item.pstatus + "</span></td>");
            } else {
                departmentTd = $("<td><span class='label label-warning'>" + item.pstatus + "</span></td>");
            }
            // alert(JSON.stringify(item))
            var uphone = $("<td></td>").append(item.chargeitem == null ? "" : item.chargeitem.cname);
            var ustarttime = $("<td></td>").append(item.user == null ? "" : item.user.uname);

            var editBtn = $("<button></button>").addClass("btn-primary btn-xs")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑").click(function () {
                    editBtnClick(item);
                });

            var delBtn = $("<button></button>").addClass("btn-danger btn-xs")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除").click(function () {
                    deleteOneBtnClick(item);
                });
            var btnTd = $("<td></td>")
                .append(editBtn)
                .append(" ")
                .append(delBtn);
            var tr = $("<tr></tr>").append(checkBox)
                .append(idTd)
                .append(nameTd)
                .append(genderTd)
                .append(pmoney)
                .append(emailTd)
                .append(departmentTd)
                .append(uphone)
                .append(ustarttime)
                .append(btnTd);
            $("#emps_table tbody").append(tr);
        });
    }
    // 选择总CheckBox时，所有元素会被选中
    $("#all_check_box").click(function () {
        // 使用prop获取原生元素值
        $(".check_box").prop("checked", $(this).prop("checked"));
    });
    // 可以在文档加载完成之后给某个元素绑定单击 事件
    $(document).on("click", ".check_box",  function() {
       var flag = $(".check_box:checked").length == $(".check_box").length;
        $("#all_check_box").prop("checked", flag);
    });

    /**
     * 单行删除按钮被按下
    */
    function deleteOneBtnClick(employee) {
        if (confirm("确认删除【"+employee.pcode+"】的信息吗")) {
            $.ajax({
                url:"${basePath}/payinfo/del/" + employee.pid,
                type:"DELETE",
                success:function (result) {
                    to_page(curPage);
                }
            });
        }
    }

    // 编辑按钮 按下
    function editBtnClick(employee) {
        // 将当前信息添加到模态框中
        $("#pid_update_label").text(employee.pid);
        $("#pcode_update_input").val(employee.pcode);
        $("#pmoney_update_input").val(employee.pmoney);
        $("#pinfo_update_input").val(employee.pinfo);
        $("[value="+employee.pstatus+"]").prop("checked",true);

        // 将ID保存至更新按钮中
        $("#update_save_button").attr("pid", employee.pid);
        // 弹出模态对话框
        $("#empUpdateModal").modal({
            backdrop:"static"
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
    /**
     * 批量删除按钮点击绑定事件
    */
    $("#batchDeleteBtn").click(function () {
        var allName = "";
        var allId = "";
        $.each($(".check_box:checked"),function (index, item) {
            // 拿到每个选中的每个员工名字,索引为2
            var name = $(this).parents("tr").find("td:eq(2)").text();
            var id = $(this).parents("tr").find("td:eq(1)").text();
            if (allName == "") {
                allName += name;
                allId += id;
            } else {
                allName += "," + name;
                allId += "," + id;
            }
        });
        if ("" != (allName) && confirm("确定要删除【" + allName + "】的信息吗")) {
            $.ajax({
                url:"${basePath}/payinfo/del/" + allId,
                type:"DELETE",
                success:function() {
                    to_page(curPage);
                }
            });
        }
    });

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

    /**
     *  输入框校验状态的改变
     */
    function show_validate_msg(ele, state, text) {
        // 先清空上一次内容
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");

        if (state == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(text);
        } else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(text);
        }
    }


    /**
     *  点击保存按钮，发送ajax请求
     */
    $("#add_save_button").click(function(){
        $.ajax({
            url:"${basePath}/payinfo/save",
            method:"POST",
            // 序列化的表单数据，通过jQuery的serialize方法
            data:$("#empAddModal form").serialize(),
            success:function (result) {
               	console.log(result);
                if (result.code==200){
                    success_prompt("添加成功");
                }else {
                    fail_prompt("添加失败失败");
                }
                $("#empAddModal").modal("hide");
                to_page(1);
            }
        });
    });

    // 修改的更新按钮被按下
    $("#update_save_button").click(function () {
        var pid = $(this).attr("pid");
        $.ajax({
           url:"${basePath}/payinfo/update/" + pid,
            type:"PUT",
            data:$("#empUpdateModal form").serializeArray(),
            success:function (result) {
                if (result.code == 200) {
                    success_prompt("修改成功")
                }else {
                    fail_prompt("修改失败")
                }
                //  关闭模态框
                $("#empUpdateModal").modal('hide');
                // 跳到修改页
                to_page(curPage);
            }
        });
    })

    /**
     * 弹出式提示框，默认1.2秒自动消失
     * @param message 提示信息
     * @param style 提示样式，有alert-success、alert-danger、alert-warning、alert-info
     * @param time 消失时间
     */
    var prompt = function (message, style, time)
    {
        style = (style === undefined) ? 'alert-success' : style;
        time = (time === undefined) ? 1200 : time;
        $('<div id="promptModal">')
            .appendTo('body')
            .addClass('alert '+ style)
            .css({"display":"block",
                "z-index":99999,
                "left":($(document.body).outerWidth(true) - 120) / 2,
                // "top":($(window).height() - 45) / 2,
                "top":0,
                "position": "absolute",
                "padding": "20px",
                "border-radius": "5px"})
            .html(message)
            .show()
            .delay(time)
            .fadeOut(10,function(){
                $('#promptModal').remove();
            });
    };

    // 成功提示
    var success_prompt = function(message, time)
    {
        prompt(message, 'alert-success', time);
    };

    // 失败提示
    var fail_prompt = function(message, time)
    {
        prompt(message, 'alert-danger', time);
    };
	</script>
</body>

</html>