package utils;

import mode.CardCode;
import mode.Information;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    private static final  String URL ="jdbc:mysql://127.0.0.1:3306/tcdiandian";
//    private static final  String URL ="jdbc:mysql://111.230.10.17:3306/tcdiandian";
    private static final  String USER ="root";
    private static final  String PASSWORD ="root";
    private static Connection connection;

    public static Connection getConnection() {
        //1.加载驱动程序
        connection = null;
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
     * 添加CardCode表单数据导数据库
     * @param card
     */
    public static void  addData(CardCode card){
         connection = getConnection();
        //拼接sql字符串
        String sql = "INSERT INTO card_form "+
                "(card_id,card_code,card_state)"+
                "value(?,?,?)";
        try {
            //执行sql语句
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,card.getCard_id());
            statement.setString(2,card.getCard_code());
            statement.setString(3,card.getCard_state());
            statement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 添加information表单数据导数据库
     * @param information
     */
    public static void  addData(Information information){
        Connection connection = getConnection();
        //拼接sql字符串
        String sql = "INSERT INTO information "+
                "(userName,address,phone,card_code,state)"+
                "value(?,?,?,?,?)";
        try {
            //执行sql语句
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,information.getUserName());
            statement.setString(2,information.getAddress());
            statement.setString(3,information.getPhone());
            statement.setString(4,information.getCard_code());
            statement.setString(5,information.getState());
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
         connection = getConnection();

        String sql = "SELECT * FROM card_form ";
        List<CardCode> list = new ArrayList<CardCode>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                CardCode code = new CardCode();
                code.setCard_id(resultSet.getInt("card_id"));
                code.setCard_code(resultSet.getString("card_code"));
                code.setCard_state(resultSet.getString("card_state"));
                list.add(code);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * 按照查询表单数据
     * @param information
     * @return
     */

    public static List queryData(Information information){
         connection = getConnection();
        List <Information> list = new ArrayList<>();

        String sql = "select * from information ";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()){
                information = new Information();
                information.setId(resultSet.getInt("id"));
                information.setUserName(resultSet.getString("userName"));
                information.setAddress(resultSet.getString("address"));
                information.setPhone(resultSet.getString("phone"));
                information.setCard_code(resultSet.getString("card_code"));
                information.setState(resultSet.getString("state"));
                list.add(information);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }


    /**
     * 按照查询劵码的数据
     * @param card_code 劵码
     * @return
     */

    public static List queryData(String card_code){
        Connection connection = getConnection();
        CardCode code = new CardCode();
        List <CardCode> list = new ArrayList<>();

        String sql = "select * from card_form where card_code = " +card_code;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()){
                code.setCard_id(resultSet.getInt("card_id"));
                code.setCard_code(resultSet.getString("card_code"));
                code.setCard_state(resultSet.getString("card_state"));
                list.add(code);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    public static void modifyData(String id){
         connection = getConnection();

        String sql = "update information set state = '已核销' where id = " +id;
        try {
            Statement statement = connection.createStatement();
            statement.execute(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /***
     * 删除表数据
     * @param id
     */
    public static void deleteData(String id){
         connection = getConnection();

        String sql = "DELETE FROM card_form WHERE card_id = 'str'".replace("str",id);

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
