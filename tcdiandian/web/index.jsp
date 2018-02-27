<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/20
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>屯昌点点网 </title>
  <meta name="keywords" content="小程序怎么注册,怎么申请小程序,微信小程序注册、申请。">
  <meta name="description" content="微信小程序怎么注册、如何申请小程序、微信附近的小程序入口、门店小程序代申请首选微申请,专业提供小程序代申请代发布服务。【屯昌点点网】">
  <meta name="application-name" content="屯昌点点网">
  <meta name="msapplication-tooltip" content="屯昌点点网">

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css">
  <%--<link rel="stylesheet" href="http://weike.hualianxin.com/source/plugin/hlx_gd/statics/css/form.css">--%>
  <style type="text/css">.order {
    width: 1200px;
  }

  .order .left {
    background: #fff
  }

  .order .left dl dd.submit input {
    background: #39B94E;
    border-radius: 5px;
  }

  .alt {
    float: left;
    width: 105px;
    text-align: center;
    line-height: 50px;
  }

  .top_box .top_menu > ul > li {
    padding: 0 15px;
  }

  .ans {
    top: 5px;
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.min.css">

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
<script src="${pageContext.request.contextPath}/js/swiper.min.js" type="text/javascript"></script>
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

</script>

<div class="order">
  <div class="left">
    <form method="post" action="http://localhost:8080/get" class="form" name="form1" onsubmit="return check(this)">
      <dl>
        <input type="hidden" name="tid" value="1">
        <input type="hidden" name="referrer" value="">
        <!-- <dd>请认真填写订单信息，以便您尽快收到货物</dd>-->
        <dd id="tab-title"><span class="alt">账号主体：</span>
          <div class="ans" style=" margin-left: 10px;">
            <input id="item1" style="width: 13px; height: 13px;" type="radio" onblur="blurchange('address')"
                   name="address" value="个体户" checked>
            <label for="item1"></label>
            <span>个体户</span>
          </div>

          <div class="ans" style=" margin-left: 10px;">
            <input id="item2" style="width: 13px; height: 13px;" type="radio" onblur="blurchange('address')"
                   name="address" value="个人">
            <label for="item2"></label>
            <span>个人</span>
          </div>
        </dd>
        <div id="tab-content">
          <!--个体-->
          <div id="content-item1" style="display: block;">
            <dd class="pro" style=" height: 200px;">
              <span class="protext alt" style=" height: 200px;">申请类型：</span>
              <span class="prolist">
     <label><input type="radio" name="pid" value="1" price="288" datatype="pid">
微信公众号（服务号）
     </label>
    <label><input type="radio" name="pid" value="8" price="399" datatype="pid">
小程序名称抢注（赠送推广名片小程序）
     </label>
     <label><input type="radio" name="pid" value="2" price="500" datatype="pid">
附近的小程序（普通门店小程序）
     </label>
<label>
<input type="radio" name="pid" value="5" price="1688" datatype="pid">
附近的小程序（高级门店小程序）
     </label>
<label>
<input type="radio" name="pid" value="10" price="999" datatype="pid">
附近的小程序（企程序企业版小程序）
</label>

<label>
<input type="radio" name="pid" value="11" price="1688" datatype="pid">
附近的小程序（餐饮美食高级店）
</label>


<label>
<input type="radio" name="pid" value="12" price="1688" datatype="pid">
附近的小程序（商超便利高级店）
</label>

<label>
<input type="radio" name="pid" value="13" price="1688" datatype="pid">
附近的小程序（服饰箱包高级店）
</label>

<label>
<input type="radio" name="pid" value="14" price="1688" datatype="pid">
附近的小程序（美妆护理高级店）
</label>


<label>
<input type="radio" name="pid" value="15" price="1688" datatype="pid">
附近的小程序（生鲜果蔬高级店）
</label>
     <br>
   </span></dd>
            <dd>
              <span class="alt">商户名称：</span>
              <input type="text" name="company_s" class="text2" placeholder="请输入企业名称">
            </dd>

          </div>

          <!--个人-->
          <div id="content-item2" style="display: none;">
            <dd class="pro" style=" height: 50px;">
              <span class="protext alt" style=" height: 50px;">申请类型：</span>
              <span class="prolist">
     <label><input type="radio" name="pid" value="微信公众号（订阅号）" price="128" datatype="pid">
微信公众号（订阅号）
     </label>
     <label><input type="radio" name="pid" value="小程序名称抢注（赠送推广名片小程序）" price="399" datatype="pid">
小程序名称抢注（赠送推广名片小程序）
     </label>
<label><input type="radio" name="pid" value="微站小程序（个人版）" price="500" datatype="pid">
微站小程序（个人版）

     </label>
     <br></span></dd>

          </div>
        </div>
        <input type="hidden" name="count" value="1">
        <input type="hidden" name="qqau" value="1">

        <div id="yzcname">
          <dd style="display: none;"><span class="alt">预注册公众号名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">小程序名称抢注：</span>
            <input type="text" class="text" placeholder="请输入小程序名称抢注">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册公众号名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">小程序名称抢注：</span>
            <input type="text" class="text" placeholder="请输入小程序名称抢注">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" style="width: 56%" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">预注册公众号名：</span>
            <input type="text" style="width: 56%" class="text" placeholder="请输入预注册名称">

          </dd>
          <dd style="display: none;"><span class="alt">小程序名称抢注：</span>
            <input type="text" class="text" placeholder="请输入小程序名称抢注">

          </dd>
          <dd style="display: none;"><span class="alt">预注册小程序名：</span>
            <input type="text" class="text" placeholder="请输入预注册名称">

          </dd>

        </div>
        <dd><span class="alt">联系人：</span><input placeholder="请输入联系人姓名" type="text" name="name" class="text"
                                                datatype="name" nullmsg="请填写姓名！" errormsg="姓名不得小于2位或大于20位！">
        </dd>
        <dd><span class="alt">手机号：</span><input placeholder="请输入联系人手机号码" id="tel" type="text" name="tel"
                                                class="text2" datatype="tel" nullmsg="请填写联系电话！"
                                                errormsg="联系电话必须是数字和-号，且不得小于7位或大于20位！">
        </dd>

        <dd style="display:none;"><span class="alt">电子邮箱：</span><input placeholder="请输入电子邮箱" type="text" name="email" class="text" datatype="email" errormsg="电子邮箱格式不合法！">
        </dd>
        <dd class="textarea"><span class="alt" style="height: 87px;">申请用途：</span><textarea name="note" placeholder="请输入申请用途" datatype="note" errormsg="申请用途不得大于250位！"></textarea>
        </dd>
        <!--<dd class="info info1">请认真填写以上信息，然后点击下面的“立即提交订单”按钮以完成下单</dd>-->
        <dd class="submit" style=" border: none;">&nbsp;&nbsp;<input  id="btn" type="submit" name="submit1" value="立即提交申请"></dd>
      </dl>
    </form>

    <script type="text/javascript">
        function check(form) {
            if (form.pid.value.length == 0) {
                alert("请选择申请类型!");
                form.userId.focus();
                return false;
            }else if (form.company_s.value.length == 0) {
                alert("请输入商户名称!");
                form.userId.focus();
                return false;
            }else if (form.name.value.length == 0) {
                alert("请输入姓名!");
                form.name.focus();
                return false;
            }else if (form.tel.value.length != 11 || isNaN(form.tel.value)) {
                alert("请输入11数字电话!");
                form.name.focus();
                return false;
            }else {
                return true;
            }
            return false
        }

        function submit(event) {
            var form = document.getElementsByClassName("form1")
            alert("获取form表单");
            if (check(form)==false){
                var event = event || window.event;
                event.preventDefault(); // 兼容标准浏览器
                window.event.returnValue = false; // 兼容IE6~8
            }
        };
    </script>
    <script>
        window.onload = function () {
            var title = document.getElementById("ans")
            var content1 = document.getElementById("content-item1")
            var content2 = document.getElementById("content-item2")
            var checkbox1 = document.getElementById("item1")
            var checkbox2 = document.getElementById("item2")
            // var submitBtn = document.getElementById("btn");
            // var form = document.getElementsByTagName("form")

            checkbox1.onclick =function () {
                if (checkbox1.checked==true) {a
                    content1.style.display = "block"
                    content2.style.display = "none"
                } else {
                    content1.style.display = "none"
                    content2.style.display = "block"
                }
            }

            checkbox2.onclick =function () {
                if (checkbox1.checked==true) {
                    content1.style.display = "block"
                    content2.style.display = "none"
                } else {
                    content1.style.display = "none"
                    content2.style.display = "block"
                }
            }
        }

        $('#tab-title input').click(function () {
            $("#tab-content > div").hide().eq($('#tab-title input').index(this)).show();
            $("#tab-total > div").hide().eq($('#tab-title input').index(this)).hide();
            $("#yzcname > dd").hide().eq($('#tab-title input').index(this)).hide();
        });

        $('#tab-content label').click(function () {
            $("#tab-total > div").show().eq($('#tab-content label').index(this)).show();
            $("#yzcname > dd").hide().eq($('#tab-content label').index(this)).show();
            $("#yzcname > dd input").attr("name", "1").eq($('#tab-content label').index(this)).attr("name", "post");
        });

    </script>
  </div>
</div>


<style>
  input[type="radio"] {
    -webkit-appearance: none;
    background: #fff url(${pageContext.request.contextPath}/images/radiostyle.png);
    height: 20px;
    vertical-align: middle;
    width: 20px;
    background-color: transparent;
    background-position: -36px -2px;
  }

  input[type="radio"]:focus,
  input[type="radio"]:hover {
    background-position: -8px -5px;
    outline: none;
  }

  input[type="radio"]:checked {
    background-position: -40px -44px;
  }

  input[type="radio"][disabled] {
    background-position: -46px -5px;
  }

  input[type="radio"][disabled]:checked {
    background-position: -8px -5px;
  }
</style>

</body>
</html>
