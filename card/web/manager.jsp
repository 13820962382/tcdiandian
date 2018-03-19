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
<html>
<head>
    <title>屯昌点点网后台管理</title>
</head>
<body>

    <div>
        
    </div>
    <h3>电子劵核销</h3>
    <form method="post" id="form1" action="${pageContext.request.contextPath}/modify">
        <table width="80%" border="1" cellpadding="5" cellspacing="0" style="text-align: center">
            <thead bgcolor="#00bfff">
            <tr>
                <th>ID</th>
                <th>联系人</th>
                <th>详细地址</th>
                <th>联系电话</th>
                <th>兑换劵码</th>
                <th>是否核销</th>
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

                    out.print("<td> <input type=\"submit\" value=\"核销\" onclick=\"document.getElementById('form1').submit()\"> </td>");
                    out.print("</tr>"+"&nbsp;&nbsp;");

            %>
            <%--<td> <a href="javascript:formSubmit()" class="button" name="3" onclick="document.getElementById('form1').submit()">核销</a> </td>--%>
            <input type="hidden" name="state" value="<%=list.get(i).getId()%>">
            <% } %>
            <td> <button id="submit" type="button" onclick="submit(this)">核销</button> </td>
        </table>

    </form>

    <script type="text/javascript">
        document.getElementById("submit").onclick = function() {
            var btn = event.target.id
            alert(""+btn.value+btn)
        }

    </script>
</body>
</html>
