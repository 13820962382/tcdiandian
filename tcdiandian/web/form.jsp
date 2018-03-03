<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/20
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.tcdiandian.uitils.*" %>
<%@ page import="com.tcdiandian.model.*" %>
<%@ page import="java.util.List" %>

<%
    List<GetFormMode> list = DbUtil.queryData();
%>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>屯昌点点网 </title>
  <meta name="keywords" content="小程序怎么注册,怎么申请小程序,微信小程序注册、申请。">
  <meta name="description" content="微信小程序怎么注册、如何申请小程序、微信附近的小程序入口、门店小程序代申请首选微申请,专业提供小程序代申请代发布服务。【屯昌点点网】">
  <meta name="application-name" content="屯昌点点网">
  <meta name="msapplication-tooltip" content="屯昌点点网">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css">
  <%--<link rel="stylesheet" href="http://weike.hualianxin.com/source/plugin/hlx_gd/statics/css/form.css">--%>
  <style type="text/css">
  .box  {
    width: 100%;
    margin: 0 auto;
    font-size: 24px;
  }

  .center {
    width: 100%;
    margin: 0 auto;
    text-align: center;
  }

  .top_box .top_menu > ul > li {
    padding: 0 15px;
  }

  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fbopinion.css">
</head>
<body id="nv_portal" class="pg_index" onkeydown="if(event.keyCode==27) return false;" style="">
<script type="text/javascript" language="javascript">
    var nav = document.getElementById("navi");
    var links = nav.getElementsByTagName("li");
    var lilen = nav.getElementsByTagName("a");
    var currenturl = document.location.href;
    var last = 0;
    for (var i = 0; i < links.length; i++) {
        var linkurl = lilen[i].getAttribute("href");
        if (currenturl.indexOf(linkurl) != -1) {
            last = i;
        }
    }
    links[last].className = "here";
</script>
<%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">--%>
<%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.min.css">--%>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/swiper.min.css">

<style>    .tab-total div {
  display: none;
}

#yzcname dd {
  display: none;
}
.apple a, .aa a {
  width: 100%;
  height: 20px;
  line-height: 20px;
  text-indent: 20px;
  color: #949494;
}
</style>
<!-- banner滚动 -->
<div class="swiper-container swpier-banner swiper-container-horizontal">
  <div class="swiper-wrapper" style="transform: translate3d(-2306px, 0px, 0px); transition-duration: 0ms;">
    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2"
         style="width: 1123px; margin-right: 30px;"><img src="${pageContext.request.contextPath}/images/banner1.jpg"></div>
    <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0"
         style="width: 1123px; margin-right: 30px;"><img src="${pageContext.request.contextPath}/images/banner3.jpg"></div>
    <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="1"
         style="width: 1123px; margin-right: 30px;"><img src="${pageContext.request.contextPath}/images/banner2.jpg"></div>
    <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="2"
         style="width: 1123px; margin-right: 30px;"><img src="${pageContext.request.contextPath}/images/banner1.jpg"></div>
    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0"
         style="width: 1123px; margin-right: 30px;"><img src="${pageContext.request.contextPath}/images/banner3.jpg"></div>
  </div>
  <!-- Add Pagination -->
  <div class="swiper-pagination b-pagination swiper-pagination-clickable swiper-pagination-bullets"><span
          class="swiper-pagination-bullet"></span><span
          class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
          class="swiper-pagination-bullet"></span></div>
  <div class="swiper-button-next b-button-next"></div>
  <div class="swiper-button-prev b-button-prev"></div>
</div>
<%--<script src="${pageContext.request.contextPath}/js/swiper.min.js" type="text/javascript"></script>--%>
<script src="/js/swiper.min.js" type="text/javascript"></script>
<script>
    var swiper = new Swiper('.swpier-banner', {
        pagination: '.b-pagination',
        nextButton: '.b-button-next',
        prevButton: '.b-button-prev',
        loop: true,
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 5000,
        autoplayDisableOnInteraction: false
    });
    var swiper = new Swiper('.scroll-anli', {
        pagination: '.s-pagination',
        nextButton: '.s-button-next',
        prevButton: '.s-button-prev',
        paginationClickable: true,
        slidesPerView: 4,
        spaceBetween: 50,
        breakpoints: {
            1024: {
                slidesPerView: 3,
                spaceBetween: 40
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 30
            },
            640: {
                slidesPerView: 1,
                spaceBetween: 20
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 10
            }
        }
    });
    // 应用场景切换
    $('.case-mian .u-nav li').click(function () {
        $(this).addClass('cur').siblings().removeClass('cur');
        var num = $(this).index() + 1
        $('.case-mian .box').hide();
        $('.case-mian .box' + num).show();
        $('.case-mian .box' + num).addClass('hui-bounceinR');
    });
    //显示二维码
    $('.litle-case-index .ani').hover(function () {
        $(this).find('.anli_mask').css('opacity', '1');
    }, function () {
        $('.anli_mask').css('opacity', '0');
    });

    function showData () {
    for(var i=0;i<3;i++){
        var element = document.createElement("td")
        element.value = "kjojijioj"
    }
  }
</script>

<div class="box">
    <table class="center">
      <thead>
      <tr>
        <th>账户主体</th>
        <th>申请类型</th>
        <th>商户名称</th>
        <th>联系人</th>
        <th>手机号</th>
        <th>申请用途</th>
      </tr>
      </thead>
        <%
          for (int i = 0; i < list.size(); i++) {
              out.print("<tr>");
              out.print("<td>");
              out.print(list.get(i).getAddress());

              out.print("</td>");
              out.print("<td>");
              out.print(list.get(i).getRequestType());
              out.print("</td>");

              out.print("<td>");
              out.print(list.get(i).getCompany());
              out.print("</td>");

              out.print("<td>");
              out.print(list.get(i).getUseName());
              out.print("</td>");

              out.print("<td>");
              out.print(list.get(i).getPhoneNum());
              out.print("</td>");

              out.print("<td>");
              out.print(list.get(i).getDescribe());
              out.print("</td>");
              out.print("</tr>"+"&nbsp;&nbsp;");
          }
        %>

    </table>
  <%--<input type="button" value="获取列表" onclick="showData()">--%>
</div>
</body>
</html>
