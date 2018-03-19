<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/19
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.DbUtil.*" %>
<%@ page import="java.util.List" %>
<%@ page import="utils.DbUtil" %>
<%@ page import="mode.Information" %>
<%@ page import="mode.CardCode" %>
<html>
<head>
    <title>屯昌点点网后台管理</title>
    <link type="text/css" rel="stylesheet" href="css/backstage.css">
</head>
<body>
<div class="content clearfix">
    <div class="main">
        <!--右侧内容-->
        <div class="cont">
            <div class="title">产品管理</div>
            <div class="details">
                <div class="details_operation clearfix">
                   <%-- <div class="bui_select">
                        <input type="button" value="添&nbsp;&nbsp;加" class="add">
                    </div>--%>
      <%--              <div class="fr">
                        <div class="text">
                            <span>商品名称：</span>
                            <div class="bui_select">
                                <select name="" id="" class="select">
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                </select>
                            </div>
                        </div>
                        <div class="text">
                            <span>上架时间：</span>
                            <div class="bui_select">
                                <select name="" id="" class="select">
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                </select>
                            </div>
                        </div>
                        <div class="text">
                            <span>搜索</span>
                            <input type="text" value="" class="search">
                        </div>
                    </div>--%>
                </div>
                <!--电子劵管理-->
                <h3>电子劵管理</h3>
                <table class="table">
                    <thead bgcolor="#00bfff">
                    <tr>
                        <th>ID</th>
                        <th>电子劵码</th>
                        <th>核销状态</th>
                        <th>管理操作</th>
                    </tr>
                    </thead>
                    <%
                        List<CardCode> codeList = DbUtil.queryFrom();
                        for (int i = 0; i < codeList.size(); i++) {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(codeList.get(i).getCard_id());
                            out.print("</td>");

                            out.print("<td>");
                            out.print(codeList.get(i).getCard_code());
                            out.print("</td>");

                            out.print("<td>");
                            out.print(codeList.get(i).getCard_state());
                            out.print("</td>");

                            out.print("<td> <input class=\"btn\" type=\"submit\" value=\"删除\" onclick=\"document.getElementById('form1').submit()\"> </td>");
                            out.print("</tr>"+"&nbsp;&nbsp;");

                    %>
                    <%--<td> <a href="javascript:formSubmit()" class="button" name="3" onclick="document.getElementById('form1').submit()">核销</a> </td>--%>
                    <%--<input type="hidden" name="state" value="<%=list.get(i).getCard_id()%>">--%>
                    <% } %>
                    <%--<td> <button class="btn" id="submit" type="button" onclick="submit(this)">核销</button> </td>--%>
                </table>
                <!--电子劵核销-->
                <h3>电子劵核销</h3>
                <form method="post" id="form1" action="${pageContext.request.contextPath}/modify">
                    <table class="table">
                        <thead bgcolor="#00bfff">
                        <tr>
                            <th>ID</th>
                            <th>联系人</th>
                            <th>详细地址</th>
                            <th>联系电话</th>
                            <th>兑换劵码</th>
                            <th>是否核销</th>
                            <th>管理操作</th>
                        </tr>
                        </thead>
                        <%
                            List<Information> list = DbUtil.queryData(new Information());
                            for (int i = 0; i < list.size(); i++) {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(list.get(i).getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(list.get(i).getUserName());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(list.get(i).getAddress());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(list.get(i).getPhone());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(list.get(i).getCard_code());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(list.get(i).getState());
                                out.print("</td>");

                                out.print("<td> <input class=\"btn\" type=\"submit\" value=\"核销\" onclick=\"document.getElementById('form1').submit()\"> </td>");
                                out.print("</tr>"+"&nbsp;&nbsp;");

                        %>
                        <%--<td> <a href="javascript:formSubmit()" class="button" name="3" onclick="document.getElementById('form1').submit()">核销</a> </td>--%>
                        <input type="hidden" name="state" value="<%=list.get(i).getId()%>">
                        <% } %>
                        <td> <button class="btn" id="submit" type="button" onclick="submit(this)">核销</button> </td>
                    </table>

                </form>
            </div>
        </div>
    </div>
    <!--左侧列表-->
    <div class="menu">
        <div class="cont">
            <div class="title">管理员</div>
            <ul class="mList">
                <li>
                    <h3><span>-</span>电子劵管理</h3>
                    <dl>
                        <dd><a href="#">电子劵管理</a></dd>
                        <dd><a href="#">电子劵核销</a></dd>
                    </dl>
                </li>
               <%-- <li>
                    <h3><span>+</span>订单管理</h3>
                    <dl>
                        <dd><a href="#">订单修改</a></dd>
                        <dd><a href="#">订单又修改</a></dd>
                        <dd><a href="#">订单总是修改</a></dd>
                        <dd><a href="#">测试内容你看着改</a></dd>
                    </dl>
                </li>--%>
            </ul>
        </div>
    </div>

</div>


    <script type="text/javascript">
        document.getElementById("submit").onclick = function() {
            var btn = event.target.id
            alert(""+btn.value+btn)
        }

    </script>
</body>
</html>
