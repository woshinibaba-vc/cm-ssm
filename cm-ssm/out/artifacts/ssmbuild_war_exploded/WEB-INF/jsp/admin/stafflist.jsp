<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>维修员信息</title>
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
						<li><a href="${basePath}/staff/list" class="active"><i class="lnr lnr-user"></i> <span>维修员信息</span></a></li>
						<li><a href="${basePath}/chargeitem/list" class=""><i class="lnr lnr-inbox"></i> <span>收费项目</span></a></li>
						<li><a href="${basePath}/payinfo/list" class=""><i class="lnr lnr-bookmark"></i> <span>缴欠费信息</span></a></li>
                        <li><a href="${basePath}/checkin/list" class=""><i class="lnr lnr-bookmark"></i> <span>访客登记列表
                    </span></a>
						<li><a href="${basePath}/repairinfo/list" class=""><i class="lnr lnr-pencil"></i> <span>申请维修信息</span></a></li>
						<li><a href="${basePath}/dorepair/list" class=""><i class="lnr lnr-enter"></i> <span>维修信息处理</span></a></li>
						<li><a href="${basePath}/moving/list" class=""><i class="lnr lnr-heart"></i> <span>小区动态信息</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- 员工修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                	<div class="form-group">
                        <label for="id_update_label" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="id_update_label" name="sid"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                            <label for="code_update_input" class="col-sm-2 control-label">维修员编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="scode" class="form-control" id="code_update_input" placeholder="请输入这位维修员的编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                        <label for="name_update_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="sname" class="form-control" id="name_update_input" placeholder="请输入这位维修员的姓名">
                                <span class="help-block"></span>
                            </div>
                    </div>
                        <div class="form-group">
                            <label for="pwd_update_input" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="spwd" class="form-control" id="pwd_update_input" placeholder="请输入这为维修员的密码">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ddd1" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10" id="ddd1">
                                男
                                <input type="radio" checked value="男" name="ssex" >
                                &nbsp;&nbsp;
                                女
                                <input type="radio" name="ssex" value="女">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    <div class="form-group">
                        <label for="phone_update_input" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10">
                            <input type="text" name="sphone" class="form-control" id="phone_update_input" placeholder="请输入这为维修员的手机">
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
                    <form class="form-horizontal" >
                        <div class="form-group">
                            <label for="id_update_label" class="col-sm-2 control-label">id</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="id_add_label" name="sid"></p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name_update_input" class="col-sm-2 control-label">维修员编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="scode" class="form-control" id="name_add_input" placeholder="请输入这位维修员的编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="sname" class="form-control" id="address_add_input" placeholder="请输入这位维修员的姓名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="area_add_input" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="spwd" class="form-control" id="area_add_input" placeholder="请输入这为维修员的密码">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ddd2" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10" id="ddd2">
                                男
                                <input type="radio" checked value="男" name="ssex" >
                                &nbsp;&nbsp;
                                女
                                <input type="radio" name="ssex" value="女">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone_add_input" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" name="sphone" class="form-control" id="phone_add_input" placeholder="请输入这为维修员的电话">
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
				<h3 class="page-title">维修员列表</h3>
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
	                    <th>维修员编号</th>
	                    <th>姓名</th>
	                    <th>密码</th>
	                    <th>性别</th>
	                    <th>电话</th>
	                    <th>好评率</th>
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
            url:"${basePath}/staff/listall",
            data:"pn=" + pn,
            type:"GET",
            success:function (result) {
                build_emps_table(result);
//                显示分页信息
                build_page_nav(result);

            }
        });
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
            var idTd = $("<td></td>").append(item.sid);
            var nameTd = $("<td></td>").append(item.scode);
            var genderTd = $("<td></td>").append(item.sname);
            var emailTd = $("<td></td>").append(item.spwd);
            var departmentTd = $("<td></td>").append(item.ssex);
            var uphone = $("<td></td>").append(item.sphone);
            var ustarttime = $("<td></td>").append(item.sevaluate);
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
        if (confirm("确认删除【"+employee.scode+"】的信息吗")) {
            $.ajax({
                url:"${basePath}/staff/del/" + employee.sid,
                type:"DELETE",
                success:function (result) {
                    success_prompt("删除成功");
                    to_page(curPage);
                }
            });
        }
    }

    // 编辑按钮 按下
    function editBtnClick(staff) {
        // 将当前信息添加到模态框中
        $("#id_update_label").text(staff.sid);
        $("#code_update_input").val(staff.scode);
        $("#name_update_input").val(staff.sname);
        $("#pwd_update_input").val(staff.spwd);
        $("#sex_update_input").val(staff.ssex);
        $("#phone_update_input").val(staff.sphone);
        $("[value="+staff.ssex+"]").prop("checked",true);
        // 将ID保存至更新按钮中
        $("#update_save_button").attr("sid", staff.sid);
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
                url:"${basePath}/staff/del/" + allId,
                type:"DELETE",
                success:function() {
                    success_prompt("删除成功");
                    to_page(curPage);
                }
            });
        }
    });
    /**
     *  点击新增按钮，发送ajax请求获取部门列表
     */
    $("#addBtn").click(function () {
//        先清空表单信息,调用dom对象的重置方法
        $("#empAddModal form")[0].reset();
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
     *  前端校验表单
    **/

    // 名字输入框ajax校验
    $("#name_add_input").change(function () {
        var name = this.value;
        $.ajax({
            url:"${basePath}/staff/validateName",
            data:"hcode="+name,
            type:"GET",
            success:function (result) {
               	//alert(result.code)
                if (result.code == 200) {
                    // 可用
                    show_validate_msg("#name_add_input", "success", "楼房名可用");
                    // 名字可用，可以保存信息至数据库
                    $("#add_save_button").attr("validate_state","success");
                } else {
                    show_validate_msg("#name_add_input", "error", "楼房名已存在");
                    // 名字不可用，不能保存
                    $("#add_save_button").attr("validate_state","error");
                }
            }
        });
    });
    /**
     *  点击保存按钮，发送ajax请求
     */
    $("#add_save_button").click(function(){
        $.ajax({
            url:"${basePath}/staff/save",
            method:"POST",
            // 序列化的表单数据，通过jQuery的serialize方法
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if (result.code == 200) {
                    success_prompt("增加成功");
                } else {
                    fail_prompt("增加失败");
                }
                //关闭模态框
                $("#empAddModal").modal('hide');
                //跳到首页
                to_page(1);
            }
        });
    });

    // 修改的更新按钮被按下
    $("#update_save_button").click(function () {
        // 直接使用ajax发送PUT请求会导致TomCat绑定数据失败，因为TomCat不会处理PUT请求，这个时候Spring提供了一种解决方法，
        // 配置httpPutFormContentFilter过滤器，将PUT请求中的数据包装成一个新的REquest
        var sid = $(this).attr("sid");
        $.ajax({
           url:"${basePath}/staff/update/" + sid,
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                if (result.code == 200) {
                    success_prompt("修改成功");
                }else {
                    fail_prompt("修改失败");
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