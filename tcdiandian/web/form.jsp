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

  </style>
</head>
<body id="nv_portal" class="pg_index" onkeydown="if(event.keyCode==27) return false;" style="">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<%--<link rel="stylesheet" type="text/css" href="/css/main.css">--%>

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
