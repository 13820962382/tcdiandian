<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/20
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="utils.*" %>
<%@ page import="java.util.List" %>
<%@ page import="mode.CardCode" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="format-detection" content="telephone=no">
    <meta charset="utf-8">
    <meta name="description" content="屯昌点点网兑换劵">
    <meta name="keywords" content="屯昌点点网兑换劵">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>屯昌点点网兑换劵</title>
    <link rel="stylesheet" href="//yun.duiba.com.cn/h5/object/goods/detail_201801301455.css">
    <link rel="stylesheet" type="text/css" href="css/order.css">

    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,viewport-fit=cover">
    <script type="text/javascript">
        !function(e,i){var t=e.documentElement,n=navigator.userAgent.match(/iphone|ipod|ipad/gi),a=n?Math.min(i.devicePixelRatio,3):1,m="orientationchange"in window?"orientationchange":"resize";t.dataset.dpr=a;var s=function(){var e=t.clientWidth;e/a>640&&(e=640*a),window.remScale=e/640,t.style.fontSize=200*(e/640)+"px"};s(),e.addEventListener&&i.addEventListener(m,s,!1)}(document,window);
    </script>

    <style>

        footer {
            padding-bottom: env(safe-area-inset-bottom);//为底下圆弧的高度 34px
        padding-bottom: constant(safe-area-inset-bottom);//为底下圆弧的高度 34px
        }
    </style>
    
</head>
<body>
<div id="db-content" style="padding-bottom: 128px;">

    <style>.address-btn.btn-submit{background: #11c3bc !important;border-color:#11c3bc !important;}.theme-color{color: #11c3bc;}.theme-bgcolor{background-color: #11c3bc;}.theme-bordercolor{border-color: #11c3bc;}.description a {color: #11c3bc;}.d-area .d-area-cur li.active .txt:after{background: #11c3bc !important;}.d-area .d-area-select ul li.active{color: #11c3bc !important;}.d-area .d-area-btn.btn-submit{background: #11c3bc !important;border-color: #11c3bc !important;}.modal-true{color: #11c3bc;}</style>
    <div class="swipe" id="swipe" style="visibility: visible;">
        <div class="swipe-wrap" style="width: 640px;">

            <div class="swiper-slide" data-index="0" style="width: 640px; left: 0px; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
                <img alt="" src="images/banner1.jpg">
            </div>

        </div>
    </div>

    <div class="item-wrapper">
        <div class="item-info">
            <div class="item-title flex">
                <h3 class="side-auto">屯昌点点网兑换劵</h3>
            </div>

            <div class="item-price flex">
                <div class="price-txt side-auto">
             <span class="num theme-color">劵码：<%String code =  RadomNum.getCode();out.print(code); %></span>
                    <span class="unit theme-color" style="color: red;margin-left: 10px"><%=RadomNum.state(code) %></span>
                    <span class="express">运费:包邮</span>
                </div>
            </div>

        </div>
    </div>
    <div class="description">
        <h3><i class="arrow"></i>输入详细信息：</h3>
        <div class="order">
            <form method="post" action="${pageContext.request.contextPath}/card" class="form" id="form1" onsubmit="return check(this)">
                <dl style="margin-top: 30px;margin-left: 30px">
                    <dd style="margin-top: 10px"><span class="alt">联系人：</span><input  placeholder="请输入联系人姓名" type="text" name="name" class="text"
                                                            datatype="name" nullmsg="请填写姓名！" errormsg="姓名不得小于2位或大于20位！">
                    </dd>
                    <dd style="margin-top: 10px"><span class="alt">手机号：</span><input  placeholder="请输入联系人手机号码" id="phone" type="text" name="phone"
                                                            class="text2" datatype="tel" nullmsg="请填写联系电话！"
                                                            errormsg="联系电话必须是数字和-号，且不得小于7位或大于20位！">
                    </dd>

                    <dd style="margin-top: 10px"><span class="alt">详细地址：</span><input  placeholder="请输入详细地址" type="text"
                                                             name="address" class="text"
                                                             datatype="address">
                    </dd>

                </dl>
                <input type="hidden" name="cardSate" value="false" />
                <input type="hidden" name="cardCode" value="69868147"/>

            </form>
        </div>

        <h3><i class="arrow"></i>详情说明：</h3>
        <div class="con">
            <div><h4>活动规则</h4>
                <ul>
                    <li><span class="wysiwyg-color-red">屯昌点点网电子兑换劵;</span></li>
                    <li><span class="wysiwyg-color-red">用来兑换商品</span></li>
                    <li><span class="wysiwyg-color-red">若有任何疑问,可联系屯昌点点网客服:67817007;</span></li>
            </ul>
                <h4>详情说明</h4>
                <p>屯昌点点网电子兑换劵，可以用来兑换实物商品。<br></p></div>
        </div>
    </div>
    </div>

    <footer>
        <input class="submit theme-bgcolor" type="submit" name="submit1" value="立即提交申请" onclick="document.getElementById('form1').submit()"></dd>
    </footer>

</div>

<script type="text/javascript">
    function check(form) {

        if (form.pid.value == '') {
            alert("请选择申请类型!");
            form.userId.focus();
            return false;
        }

        if (form.name.value == '') {
            alert("请输入姓名!");
            form.name.focus();
            return false;
        }

        if (form.tel.value == '') {
            alert("请输入11数字电话!");
            form.name.focus();
            return false;
        }
        var lee = document.forms["form1"].lee;
        if (lee.checked == true) {
        }
        else {
            alert('须同意代申请服务协议方可下单');
            return false;
        }

        return true;
    }
</script>

<script type="text/javascript">
    Zepto(function($) {
        /**
         * 链接转换
         */
        var isOpen = false
        var links = $('[data-tag="is-link"]')

        links.each(function() {
            if (isOpen) {
                var text = $(this).text()
                $(this).replaceWith('<span>' + text + '</span>')
            } else {
                $(this).removeAttr('data-tag')
            }
        })
    })
</script>
</body>
</html>
