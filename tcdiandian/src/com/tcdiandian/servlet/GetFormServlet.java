package com.tcdiandian.servlet;

import com.tcdiandian.model.GetFormMode;
import com.tcdiandian.uitils.DbUtil;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetFormServlet")
public class GetFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();

        GetFormMode formMode = new GetFormMode();
        formMode.setAddress(request.getParameter("address"));
        formMode.setRequestType(request.getParameter("pid"));
        formMode.setUseName(request.getParameter("name"));
        formMode.setCompany(request.getParameter("company_s"));
        formMode.setPhoneNum(request.getParameter("tel"));
        formMode.setDescribe(request.getParameter("note"));
        if (formMode.getRequestType()!=null){
            DbUtil.addData(formMode);
            writer.print("<script type=\"text/javascript\"> alert('提交成功') </script>");
            System.out.println(formMode.getRequestType());
        }else {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
