package com.tcdiandian.servlet;

import com.tcdiandian.model.GetFormMode;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetFormServlet")
public class GetFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        GetFormMode formMode = new GetFormMode();
        formMode.setAddress(request.getParameter("address"));
        formMode.setRequestType(request.getParameter("pid"));
        formMode.setUseName(request.getParameter("company_s"));
        formMode.setPhoneNum(request.getParameter("phone"));
        formMode.setDescribe(request.getParameter("note"));

        if (formMode.getRequestType()!=null&&formMode.getPhoneNum().length()!=0&&formMode.getUseName().length()!=0&&formMode.getDescribe().length()!=0){
            System.out.println("账户主体："+formMode.getAddress());
            System.out.println("申请类型："+formMode.getRequestType());
            System.out.println("商户名称："+formMode.getUseName());
            System.out.println("联系电话："+formMode.getPhoneNum());
            System.out.println("用途："+formMode.getDescribe());
        }else {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
