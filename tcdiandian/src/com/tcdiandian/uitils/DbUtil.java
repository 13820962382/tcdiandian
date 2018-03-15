package com.tcdiandian.uitils;

import com.tcdiandian.model.GetFormMode;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
//    private static final  String URL ="jdbc:mysql://127.0.0.1:3306/tcdiandian";
    private static final  String URL ="jdbc:mysql://111.230.10.17:3306/tcdiandian";
    private static final  String USER ="root";
    private static final  String PASSWORD ="chen630121101";

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
    public static List queryFrom(){
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

    /**
     * 按照字段查询数据
     * @param useName
     * @return
     */

    public static List queryData(String useName){
        Connection connection = getConnection();
        GetFormMode mode = new GetFormMode();
        List <GetFormMode> list = new ArrayList<>();

        String sql = "select * from tcdaindain_form where useName = "+useName;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()){
                mode.setId(resultSet.getInt("id"));
                mode.setAddress(resultSet.getString("address"));
                mode.setRequestType(resultSet.getString("requestType"));
                mode.setUseName(resultSet.getString("useName"));
                mode.setPhoneNum(resultSet.getString("phoneNum "));
                mode.setDescribe(resultSet.getString("desbe"));
                mode.setCompany(resultSet.getString("company"));
                list.add(mode);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    /***
     * 删除表数据
     * @param id
     */
    public static void deleteData(String id){
        Connection connection = getConnection();

        String sql = "DELETE FROM tcdiandain_form WHERE ID = 'str'".replace("str",id);

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
