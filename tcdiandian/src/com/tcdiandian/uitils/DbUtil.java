package com.tcdiandian.uitils;

import com.tcdiandian.model.GetFormMode;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    private static final  String URL ="jdbc:mysql://127.0.0.1:3306/tcdiandian";
    private static final  String USER ="root";
    private static final  String PASSWORD ="root";

    public static Connection getConnection() {
        //1.加载驱动程序
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //2.获得数据库的链接
            connection = DriverManager.getConnection(URL,USER,PASSWORD);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }




        return connection;
    }

    /**
     * 添加表单数据导数据库
     * @param formMode
     */
    public static void  addData(GetFormMode formMode){
        Connection connection = getConnection();
        //拼接sql字符串
        String sql = "INSERT INTO tcdiandain_form "+
                "(address,company,useName,phoneNum,requestType,desbe)"+
                "value(?,?,?,?,?,?)";
        try {
            //执行sql语句
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,formMode.getAddress());
            statement.setString(2,formMode.getCompany());
            statement.setString(3,formMode.getUseName());
            statement.setString(4,formMode.getPhoneNum());
            statement.setString(5,formMode.getRequestType());
            statement.setString(6,formMode.getDescribe());

            statement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     * 查询表单数据
     * @return
     */
    public static List queryData(){
        Connection connection = getConnection();

        String sql = "SELECT * FROM tcdiandain_form";
        List<GetFormMode> list = new ArrayList<GetFormMode>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                GetFormMode formMode = new GetFormMode();
                formMode.setAddress(resultSet.getString("address"));
                formMode.setCompany(resultSet.getString("company"));
                formMode.setUseName(resultSet.getString("useName"));
                formMode.setPhoneNum(resultSet.getString("phoneNum"));
                formMode.setRequestType(resultSet.getString("requestType"));
                formMode.setDescribe(resultSet.getString("desbe"));
                list.add(formMode);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}
