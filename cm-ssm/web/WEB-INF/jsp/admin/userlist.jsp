<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>业主信息</title>
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
    <!--摄像头模态框-->
    <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 style="text-align: center;" class="modal-title" id="videoModalLabel">添加人脸</h4>
                </div>
                <div class="modal-body">
                    <div style=";width:500px;height: 500px;margin: auto;text-align: center">
                        <video id="video" width="500px" height="500px" autoplay></video>
                        <canvas hidden="hidden" id="canvas" width="500px" height="500px"></canvas>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="videoCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="videoSubmitBtn" type="button" class="btn btn-primary">提交</button>
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
                                <%--<li><a href="#"><i class="lnr lnr-envelope"></i> <span>消息</span></a></li>
                                <li><a href="#"><i class="lnr lnr-cog"></i> <span>设置</span></a></li>--%>
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
                        <li><a href="${basePath}/user/list" class="active"><i class="lnr lnr-user"></i> <span>业主信息</span></a></li>
                        <li><a href="${basePath}/garage/list" class=""><i class="lnr lnr-user"></i> <span>停车场管理</span></a></li>
                        <li><a href="${basePath}/chargeitem/list" class=""><i class="lnr lnr-inbox"></i><span>收费项目</span></a></li>
                        <li><a href="${basePath}/payinfo/list" class=""><i class="lnr lnr-bookmark"></i> <span>缴欠费信息</span></a></li>
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
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name_add_input" class="col-sm-2 control-label">业主编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="uid" class="form-control" id="id_update_label" placeholder="请输入业主编号">
                            <input type="text" name="ucode" class="form-control" id="uCode_update_label" placeholder="请输入业主编号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address_add_input" class="col-sm-2 control-label">业主名</label>
                        <div class="col-sm-10">
                            <input type="text" name="uname" class="form-control" id="name_update_input" placeholder="请输入业主名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="area_add_input" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="upwd" class="form-control" id="address_update_input" value="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="height_add_input" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="text" name="usex" class="form-control" id="sex_update_input" placeholder="请输入业主性别">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel_add_input" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="uphone" class="form-control" id="tel_update_input" placeholder="请输入业主电话">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rz_add_input" class="col-sm-2 control-label">入住人数</label>
                        <div class="col-sm-10">
                            <input type="text" name="upeoplenum" class="form-control" id="rz_update_input" placeholder="请输入业主家入住人数">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site_add_input" class="col-sm-2 control-label">房间位置</label>
                        <div class="col-sm-10">
                            <input type="text" name="uhousecode" class="form-control" id="site_update_input" placeholder="请输入业主家具体楼层房间号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="update_save_button">Update</button>
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
                            <label for="name_add_input" class="col-sm-2 control-label">业主编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="ucode" class="form-control" id="name_add_input" required placeholder="请输入业主编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                        <label for="address_add_input" class="col-sm-2 control-label">业主名</label>
                            <div class="col-sm-10">
                                <input type="text" name="uname" class="form-control" id="address_add_input" required placeholder="请输入业主名">
                                <span class="help-block"></span>
                            </div>
                    	</div>
                        <div class="form-group">
                            <label for="area_add_input" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="upwd" class="form-control" id="area_add_input" required value="88888888">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="height_add_input" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" name="usex" class="form-control" id="height_add_input" required placeholder="请输入业主性别">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel_add_input" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" name="uphone" class="form-control" id="tel_add_input" required placeholder="请输入业主电话">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rz_add_input" class="col-sm-2 control-label">入住时间</label>
                            <div class="col-sm-10">
                                <input type="date" name="ustarttime" class="form-control" required id="time_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rz_add_input" class="col-sm-2 control-label">入住人数</label>
                            <div class="col-sm-10">
                                <input type="text" name="upeoplenum" class="form-control" id="rz_add_input" required placeholder="请输入业主家入住人数">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="site_add_input" class="col-sm-2 control-label">房间位置</label>
                            <div class="col-sm-10">
                                <input type="text" name="uhousecode" class="form-control" id="site_add_input" required placeholder="请输入业主家具体楼层房间号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="theme_add_input" class="col-sm-2 control-label">前端主题</label>
                            <div class="col-sm-10">
                                <input type="text" name="utheme" class="form-control"  id="theme_add_input" required value="默认">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lf_add_input" class="col-sm-2 control-label" id="lf_add_input">所属楼房</label>
                            <div class="col-sm-10">
                                <select name="hid" id="ms" required>
                                    <option value="100">A1栋</option>
                                    <option>A2栋</option>
                                    <option>A3栋</option>
                                </select>
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
				<h3 class="page-title">用户列表</h3>
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
            <table class="table table-hover table-striped table-bordered" id="users_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="all_check_box"/></th>
                        <th>id</th>
				                    <th>业主编号</th>
				                    <th>业主名</th>
				                    <th>密码</th>
				                    <th>性别</th>
				                    <th>电话</th>
				                    <th>入住时间</th>
				                    <th>入住人数</th>
				                    <th>房间位置</th>
				                    <th>前台主题</th>
				                    <th>所属楼房</th>
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
        //当前页面
        var pageno;
        $(function (){
            to_page(pageno);
        })
        /**
         *分页跳转
         * */
        function to_page(pn){
            $.ajax({
                url:"${basePath}/user/userList",
                data:{"pn":pn},
                type:"GET",
                success:function (data){
                    // var resault = JSON.stringify(data);
                    //建造表格
                    build_users_table(data);
                    //建造分页角标
                    build_page_nav(data);
                }
            })
        }

        //读取后端传来的分页数据，生成表格数据
        function build_users_table(resault){
            //先清空再添加
            $("#users_table tbody").empty();
            var users = resault.list;
            console.log(users)
            $.each(users,function (index,item){
                var checkbox = $("<td></td>").append("<input type='checkbox' class='check_box'>");
                var uid = $("<td></td>").append(item.uid);
                var ucode = $("<td></td>").append(item.ucode);
                var uname = $("<td></td>").append(item.uname);
                var upwd = $("<td></td>").append(item.upwd);
                var usex = $("<td></td>").append(item.usex);
                var uphone = $("<td></td>").append(item.uphone);
                var ustarttime = $("<td></td>").append(timestampToTime(item.ustarttime));
                var upeoplenum = $("<td></td>").append(item.upeoplenum);
                var uhousecode = $("<td></td>").append(item.uhousecode);
                var utheme = $("<td></td>").append(item.utheme);
                var hid = $("<td></td>").append(item.house == null ? "" : item.house.hcode);

                var edit_btn = $("<button></button>").addClass("btn-primary btn-xs")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑").click(function (){
                        //按钮编辑事件
                        editBtnClick(item);
                    });

                var del_btn = $("<button></button>").addClass("btn-danger btn-xs")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除").click(function (){
                        //按钮删除事件
                        deleteOneBtnClick(item);
                    });

                <!--打开添加人脸模态框按钮-->
                var face_btn = $("<button></button>").addClass("btn btn-info btn-xs")
                    .append($("<span></span>").addClass("glyphicon glyphicon-plus"))
                    .append("添加人脸").click(function (){
                        //deleteOneBtnClick(item);
                        showFaceAddModel(item);
                    });

                var btn = $("<td></td>").append(edit_btn)
                    .append(" ").append(del_btn).append(" ").append(face_btn);

                var tr = $("<tr></tr>").append(checkbox).append(uid)
                    .append(ucode).append(uname).append(upwd)
                    .append(usex).append(uphone).append(ustarttime)
                    .append(upeoplenum).append(uhousecode)
                    .append(utheme).append(hid).append(btn);
                $("#users_table tbody").append(tr);
            })
        }

        // 编辑按钮 按下
        function editBtnClick(user) {
            console.log(user);
            // 将当前信息添加到模态框中
            $("#id_update_label").val(user.uid);
            $("#uCode_update_label").val(user.ucode);
            $("#name_update_input").val(user.uname);
            $("#address_update_input").val(user.upwd);
            $("#sex_update_input").val(user.usex);
            $("#tel_update_input").val(user.uphone);
            $("#rz_update_input").val(user.upeoplenum);
            $("#site_update_input").val(user.uhousecode);

            // 将ID保存至更新按钮中
            $("#update_save_button").attr("hid", user.uid);
            // 弹出模态对话框
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        }

        //单行删除按钮被按下
        function deleteOneBtnClick(user) {
            if (confirm("确认删除【"+user.ucode+"】的信息吗")) {
                $.ajax({
                    url:"${basePath}/user/del/" + user.uid,
                    type:"DELETE",
                    success:function (result) {
                        if (result.code==200){
                            success_prompt("删除成功");
                        }else {
                            fail_prompt("删除失败");
                        }
                        to_page(pageno);
                    }
                });
            }
        }

    //将时间戳转换为标准化时间格式
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
     * 分页信息的显示
     * @param result 服务器返回的json数据
     */
    function build_page_nav(result){
        //先清空分页条再生成----  page_inf  navUl
        $("#page_inf").empty();
        $("#navUl").empty();
        //当前页
        pageno = result.pageNum;
        //左侧页码信息
        $("#page_inf").append("当前第"+result.pageNum+"页，总"+result.pages
            +"页，总"+result.total+"条记录");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var nextPageLI = $("<li></li>").append($("<a></a>").append("&raquo;"));

        $("#navUl").append(firstPageLi);
        $("#navUl").append(prePageLi);
        if (result.pageNum == 1) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function (){
                to_page(1);
            });
            prePageLi.click(function (){
                to_page(result.pageNum-1);
            });
        }

        var navNums = result.navigatepageNums;
            // 遍历当前显示页数
            $.each(navNums, function (index, item) {
                var li = $("<li></li>").append($("<a></a>").append(item))
                    .click(function () {
                        to_page(item);
                    });
                if (item == result.pageNum) {
                    li.addClass("active");
                }
                $("#navUl").append(li);
            });

        $("#navUl").append(nextPageLI);
        $("#navUl").append(lastPageLi);
        if (result.pageNum==result.pages){
            nextPageLI.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLI.click(function (){
                to_page(result.pageNum+1);
            });
            lastPageLi.click(function (){
                to_page(result.lastPage);
            });
        }

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
                url:"${basePath}/user/del/" + allId,
                type:"DELETE",
                success:function(data) {
                    to_page(pageno);
                    if (data.code==200){
                        success_prompt("删除成功");
                    }else {
                        fail_prompt("删除失败");
                    }
                }
            });
        }
    });

    //点击新增按钮，发送ajax请求获取部门列表
    $("#addBtn").click(function () {
        $("#ms").empty();
        //获取当前时间注入到表单date中
        $.ajax({
            url:"${basePath}/house/h_list",
            type:"GET",
            success:function (data){
                $.each(data,function(index,item){
                    var option = $("<option value="+item.hid+">"+item.hcode+"</option>");
                    $("#ms").append(option)
                })
            }
        })
        //先清空表单信息,调用dom对象的重置方法
        $("#empAddModal form")[0].reset();
        // 发送ajax请求获得部门信息
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
            url:"${basePath}/user/validateName",
            data:"ucode="+name,
            type:"GET",
            success:function (result) {
               	//alert(result.code)
                if (result.code == 200) {
                    // 可用
                    show_validate_msg("#name_add_input", "success", "业主编号可用");
                    // 名字可用，可以保存信息至数据库
                    $("#add_save_button").attr("validate_state","success");
                } else {
                    show_validate_msg("#name_add_input", "error", "业主编号已存在");
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
        // 如果校验失败，直接返回
        // 通过ajax校验名字是否重复,判断validate_state的值是成功还是失败,失败不能保存
        if ($(this).attr("validate_state") != "success") {
            return false;
        }
        $.ajax({
            url:"${basePath}/user/save",
            method:"POST",
            // 序列化的表单数据，通过jQuery的serialize方法
            data:$("#empAddModal form").serialize(),
            success:function (result) {
               	console.log(result);
               	if (result.code==200){
                    success_prompt("提交成功");
                }else {
               	    fail_prompt("提交失败");
                }
//              关闭模态框
                $("#empAddModal").modal('hide');
//              跳到首页
                to_page(1);
            }
        });
    });

    // 修改的更新按钮被按下
    $("#update_save_button").click(function () {
        // 直接使用ajax发送PUT请求会导致TomCat绑定数据失败，因为TomCat不会处理PUT请求，这个时候Spring提供了一种解决方法，
        // 配置httpPutFormContentFilter过滤器，将PUT请求中的数据包装成一个新的REquest
        var empId = $(this).attr("hid");
        $.ajax({
           url:"${basePath}/user/update/" + empId,
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                if (result.code == 200) {
                    success_prompt("修改成功");
                    //  关闭模态框
                }else {
                    fail_prompt("修改失败");
                }
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

        var video;//视频流对象
        var context;//绘制对象
        var canvas;//画布对象

        /**
         * 显示模态框，并且存储要添加人脸的用户id
         * @param item
         */
        function showFaceAddModel(user){
            open();
            $("#videoSubmitBtn").attr("userId",user.uid);
            $("#videoModal").modal("show");
        }

        //关闭摄像头
        $("#videoCloseBtn").click(function (){
            video.srcObject.getTracks()[0].stop();
        })
        //点击提交拍照，发送注册请求
        $("#videoSubmitBtn").click(function (){
            var userId = $(this).attr("userId");
            context.drawImage(video, 0, 0, 500, 440);
            //获取图像
            var img = getBase64();
            //Ajax将Base64字符串传输到后台处理
            $.ajax({
                type : "POST",
                async : false,
                url : "${pageContext.request.contextPath}/face/addUser",
                data : {
                    "image" : img,
                    "userId":userId
                },
                dataType : "JSON",
                success : function(data) {
                    //返回的结果
                    if (data.error_msg=="SUCCESS"){
                        success_prompt("添加成功");
                        $("#videoModal").modal("hide");
                        video.srcObject.getTracks()[0].stop();
                    }else if(data.error_msg=="pic not has face"){
                        fail_prompt("请将人脸对准摄像头");
                    }else {
                        fail_prompt("非法人脸，请重试")
                    }
                    console.log(data)
                },
                error : function(q, w, e) {
                    alert(q + w + e);
                }
            });
        })
        //将当前图像传输到后台
        function CatchCode() {
            //获取图像
            var img = getBase64();
            //Ajax将Base64字符串传输到后台处理
            $.ajax({
                type : "POST",
                async : false,
                url : "${pageContext.request.contextPath}/face/addUser",
                data : {
                    image : img
                },
                dataType : "JSON",
                success : function(data) {
                    //返回的结果
                    if (data.error_msg=="SUCCESS"){
                        success_prompt("添加成功");
                    }
                    alert(JSON.stringify(data));
                },
                error : function(q, w, e) {
                    alert(q + w + e);
                }
            });
        };
        //开启摄像头
        function open() {
            //获取摄像头对象
            canvas = document.getElementById("canvas");
            context = canvas.getContext("2d");
            //获取视频流
            video = document.getElementById("video");
            var videoObj = {
                "video" : true
            }, errBack = function(error) {
                console.log("Video capture error: ", error.code);
            };
            context.drawImage(video, 0, 0, 600, 500);
            //初始化摄像头参数
            if (navigator.getUserMedia || navigator.webkitGetUserMedia
                || navigator.mozGetUserMedia) {
                navigator.getUserMedia = navigator.getUserMedia
                    || navigator.webkitGetUserMedia
                    || navigator.mozGetUserMedia;
                navigator.getUserMedia(videoObj, function(stream) {
                    video.srcObject = stream;
                    video.play();
                }, errBack);
            }
        }
        //将摄像头拍取的图片转换为Base64格式字符串
        function getBase64() {
            //获取当前图像并转换为Base64的字符串
            var imgSrc = canvas.toDataURL("image/png");
            //截取字符串
            return imgSrc.substring(22);
        };

	</script>
</body>

</html>