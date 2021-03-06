package servlet;

import mode.Information;
import utils.DbUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CardServlet")
public class CardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();

        Information information = new Information();
        information.setAddress(request.getParameter("address"));
        information.setUserName(request.getParameter("name"));
        information.setPhone(request.getParameter("phone"));
        information.setState(request.getParameter("cardSate"));
        information.setCard_code(request.getParameter("cardCode"));

        DbUtil.addData(information);

        writer.print("<script type=\"text/javascript\"> alert("+information.getUserName()+") </script>");
        System.out.println("提交的卷码:"+information.getCard_code());
        System.out.println("提交的人:"+information.getUserName());
        System.out.println("提交的电话号码:"+information.getPhone());
        System.out.println("卷码的状态:"+information.getState());

//        response.sendRedirect("/index.jsp");

        writer.print("您信息已提交成功");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
