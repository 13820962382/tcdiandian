package utils;

import mode.CardCode;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    private static final  String URL ="jdbc:mysql://127.0.0.1:3306/tcdiandian";
//    private static final  String URL ="jdbc:mysql://111.230.10.17:3306/tcdiandian";
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
     * @param card
     */
    public static void  addData(CardCode card){
        Connection connection = getConnection();
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
     * 查询表单数据
     * @return
     */
    public static List queryFrom(){
        Connection connection = getConnection();

        String sql = "SELECT * FROM card_form";
        List<CardCode> list = new ArrayList<CardCode>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                CardCode code = new CardCode();
                code.setCard_id(resultSet.getInt("card_id"));
                code.setCard_code(resultSet.getString("card_code"));
                code.setCard_state(resultSet.getString("card_state"));

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
        CardCode code = new CardCode();
        List <CardCode> list = new ArrayList<>();

        String sql = "select * from card_form where useName = "+useName;
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

    /***
     * 删除表数据
     * @param id
     */
    public static void deleteData(String id){
        Connection connection = getConnection();

        String sql = "DELETE FROM card_form WHERE ID = 'str'".replace("str",id);

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
