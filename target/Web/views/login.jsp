<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>登录界面</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/requestAnimationFrame.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Star.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Particle.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Smoke.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/Treatment.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mockjax.js" type="text/javascript"></script>
</head>
<body>
	 <div style="position: absolute;z-index: 1;">
		<canvas id="canvas_app" class="first"></canvas>
	  </div>
	<div class='login' style="position: absolute;z-index: 10;">
	  <div class='login_title'>
	    <span><center><h3>用户登录</h3></center></span>
	  </div>
	  <div class='login_fields'>
		<form action="/web/login.do" method="post" onsubmit="return checkCode()">
	    <div class='login_fields__user'>
	      <div class='icon'>
	        <img alt="" src='${pageContext.request.contextPath}/img/user_icon_copy.png'>
	      </div>
	      <input name="username" id="username" placeholder='用户名' maxlength="16" type='text' autocomplete="off"/>
	        <div class='validation'>
	          <img alt="" src='${pageContext.request.contextPath}/img/tick.png'>
	        </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='${pageContext.request.contextPath}/img/lock_icon_copy.png'>
	      </div>
	      <input name="password" id="password" placeholder='密码' maxlength="16" type='text' autocomplete="off">
	      <div class='validation'>
	        <img alt="" src='${pageContext.request.contextPath}/img/tick.png'>
	      </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='${pageContext.request.contextPath}/img/key.png'>
	      </div>
	      <input name="code" id="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
	      <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
          <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
	      </div>
	    </div>
	    <div class='login_fields__submit'>
	      <input type='submit' value='登录'>
	    </div>
		</form>
	  </div>
	</div>
	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var CodeVal = 0;
	    Code();
	    function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}
			else{
				showCheck(createCode(""));
			}
	    }
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="submit"]').click();
	        }
	    });
	    $('input[name="password"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    function checkCode() {
	        if($("#username").val().length==0||$("#password").val().length==0){
	            alert("用户名或密码不能为空");
	            return false;
            }
            else if($("#code").val().length==0){
	            alert("验证码不能为空");
	            return false;
			}
			else if($("#code").val().toUpperCase()!=CodeVal.toUpperCase()){
			    alert("验证码错误！");
			    return false;
			}
			else{
			    return true;
			}
        }
    </script>
</body>
</html>
<script>
    $(window).resize(resizeCanvas);
    $(window).load(onloadFun);
    var model = { //数据配置
        hue: 237,
        stars: [],
        starImg: null,
        count: 0,
        smoke: null,
        maxStars: 4600,
    }
    var canvas = $("#canvas_app");
    var ctx = canvas.get(0).getContext("2d");
    var starImg;
    function init() {
        createStar(); //星星
        createSmoke(); //烟雾
        animation();
    }
    function animation() {
        ctx.globalCompositeOperation = 'source-over';
        ctx.globalAlpha = 0.3;
        ctx.fillStyle = 'hsla(' + model.hue + ', 64%, 6%, 1)';
        ctx.fillRect(0, 0, $(window).get(0).innerWidth, $(window).get(0).innerHeight)
        ctx.globalCompositeOperation = 'lighter';

        for (var i = 1, l = model.stars.length; i < l; i++) {
            model.stars[i].draw(ctx, model.starImg);
        };

        model.smoke.update(ctx);

        window.requestAnimationFrame(animation);
    }
    function createStar() {

        //圆点
        var canvas2 = document.createElement('canvas');
        model.starImg = canvas2;
        var ctx2 = canvas2.getContext("2d");
        canvas2.width = 88;
        canvas2.height = 88;
        var half = canvas2.width / 2;
        var gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
        gradient2.addColorStop(0.01, '#fff');
        gradient2.addColorStop(0.1, 'hsl(' + model.hue + ', 80%, 45%)');
        gradient2.addColorStop(0.15, 'hsl(' + model.hue + ', 90%, 55%)');
        gradient2.addColorStop(0.26, 'transparent');
        ctx2.fillStyle = gradient2;
        ctx2.beginPath();
        ctx2.arc(half, half, half, 0, Math.PI * 2);
        ctx2.fill();

        for (var i = 0; i < model.maxStars; i++) {
            var star = new Star($(window).get(0).innerWidth, $(window).get(0).innerHeight, model.maxStars);
            model.stars[i] = star;
        }
    }
    function createSmoke() {
        model.smoke = new Smoke();
    }
    function resizeCanvas() {
        canvas.attr("width", $(window).get(0).innerWidth);
        canvas.attr("height", $(window).get(0).innerHeight);
        ctx.fillRect(0, 0, canvas.width(), canvas.height());
        //图片
        $(".second").attr("width", $(window).get(0).innerWidth);
        $(".second").attr("height", $(window).get(0).innerHeight);
    }
    function onloadFun() {
        init();
        resizeCanvas();
    }
</script>