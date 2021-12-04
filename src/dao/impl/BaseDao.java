/*
 * Dao�Ļ��࣬ʹ��JDBC�������ݿ⡢�ͷ���Դ��ִ��sql�����Ա�����Daoʵ����̳л�ʵ����ʹ��
 */
package dao.impl;

import java.sql.*;

import entity.User;

public class BaseDao {
    public final static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; //
    public final static String url = "jdbc:sqlserver://localhost:1433;DataBaseName=bbs"; //
    public final static String dbName = "sa"; //
    public final static String dbPass = "sa"; //



    public Connection getConn() throws ClassNotFoundException, SQLException {
        Class.forName(driver); //
        Connection conn = DriverManager.getConnection(url, dbName, dbPass); //
        return conn; //
    }


    public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {

        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public int executeSQL(String preparedSql, String[] param) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int num = 0;


        try {
            conn = getConn(); //
            pstmt = conn.prepareStatement(preparedSql); //
            if (param != null) {
                for (int i = 0; i < param.length; i++) {
                    pstmt.setString(i + 1, param[i]); //
                }
            }
            num = pstmt.executeUpdate(); //
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); //
        } catch (SQLException e) {
            e.printStackTrace(); //
        } finally {
            closeAll(conn, pstmt, null);
        }
        return num;
    }
}
