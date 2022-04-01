<%--
  Created by IntelliJ IDEA.
  User: stop
  Date: 2022/3/30
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
<div style=";width:500px;height: 500px;margin: auto;text-align: center">
    <video id="video" width="500px" height="500px" autoplay></video>
    <canvas hidden="hidden" id="canvas" width="500px" height="500px"></canvas>
</div>

</body>
<script type="text/javascript">
    var video;//视频流对象
    var context;//绘制对象
    var canvas;//画布对象
    $(function() {
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
        //一秒钟拍照一次检测人脸
        var int=self.setInterval("CatchCode()",3000);
    });

    //将当前图像传输到后台
    function CatchCode() {
        context.drawImage(video, 0, 0, 500, 440);
        //获取图像
        var img = getBase64();
        //Ajax将Base64字符串传输到后台处理
        $.ajax({
            type : "POST",
            async : false,
            url : "${pageContext.request.contextPath}/face/sample",
            data : {
                "image" : img
            },
            dataType : "JSON",
            success : function(data) {
                //返回的结果
                console.log(data);
                if (data.error_msg=="pic not has face"){

                }else if(data.error_msg=="SUCCESS"){
                    if (data.result.user_list[0].score>80){
                        success_prompt("认证成功")
                    }else {
                        fail_prompt("认证失败")
                    }
                }else {
                    fail_prompt("未通过，请正对摄像头")
                }
            },
            error : function(q, w, e) {
                alert(q + w + e);
            }
        });
    };

    //将摄像头拍取的图片转换为Base64格式字符串
    function getBase64() {
        //获取当前图像并转换为Base64的字符串
        var imgSrc = canvas.toDataURL("image/png");
        //截取字符串
        return imgSrc.substring(22);
    };


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
</html>
