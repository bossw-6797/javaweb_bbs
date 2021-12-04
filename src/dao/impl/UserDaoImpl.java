package dao.impl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.UserDao;
import entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

    private static final User User = null;
	private Connection conn = null;       // 淇濆瓨鏁版嵁搴撹繛鎺�
    private PreparedStatement pstmt = null;       // 鐢ㄤ簬鎵цSQL璇彞
    private ResultSet rs = null;       // 鐢ㄦ埛淇濆瓨鏌ヨ缁撴灉闆�
    /**
     * 澧炲姞鐢ㄦ埛
     *
     * @param user
     * @return 澧炲姞鏉℃暟
     */
    public int addUser(User user) {
        String sql = "insert into TBL_USER(uname,upass,gender,head,regTime) values(?,?," + user.getGender() + ",?,?)";
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  
        String[] parm = {user.getUserName(), user.getUserPass(), user.getHead(), time};
        return this.executeSQL(sql, parm);  
    }

    /**
     * 淇敼鐢ㄦ埛瀵嗙爜
     *
     * @param user
     * @return 鏇存柊鏉℃暟
     */
    public int updateUser(User user) {
        String sql = "update TBL_USER set uPass=? where uName=?";
        String[] parm = {user.getUserPass(), user.getUserName()};
        return this.executeSQL(sql, parm);        // 鎵цsql锛屽苟杩斿洖褰卞搷琛屾暟
    }

    public User findUser(String username) {
//select * from TBL_USER where username = ?
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DataBaseName = bbs", "sa", "sa");
            String sql = "select * from TBL_USER where uName='" + username + "'";
            ps = conn.prepareStatement(sql);
            //ps.setString(1,username );
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("uId"));
                user.setUserName(rs.getString("uName"));
                user.setUserPass(rs.getString("uPass"));
                user.setGender(rs.getString("gender"));
                user.setHead(rs.getString("head"));
                user.setRegTime(rs.getDate("regTime"));
                return user;
              	}
              } catch (Exception e) {
                  e.printStackTrace();                 
              } finally {
            	  try{
                  rs.close();
                  ps.close();
                  conn.close();
            	  }catch(SQLException e){
            		  e.printStackTrace();
            	  }
              }
              return null;
          }

	@Override
	public User findUser(int userId) {
		 Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DataBaseName = bbs", "sa", "sa");
	            String sql = "select * from TBL_USER where uId='" + userId + "'";
	            ps = conn.prepareStatement(sql);
	            //ps.setString(1,username );
	            rs = ps.executeQuery();
	            while (rs.next()) {
	                User user = new User();
	                user.setUserId(rs.getInt("uId"));
	                user.setUserName(rs.getString("uName"));
	                user.setUserPass(rs.getString("uPass"));
	                user.setGender(rs.getString("gender"));
	                user.setHead(rs.getString("head"));
	                user.setRegTime(rs.getDate("regTime"));
	                return user;
	              	}
	              } catch (Exception e) {
	                  e.printStackTrace();                 
	              } finally {
	            	  try{
	                  rs.close();
	                  ps.close();
	                  conn.close();
	            	  }catch(SQLException e){
	            		  e.printStackTrace();
	            	  }
	              }
	              return null;
	          }


//    public User findUser(int uId) {
//        String sql = "select * from TBL_USER where uId=?";
//        User user = null;
//        try {
//            conn = this.getConn();                  //鍙栧緱鏁版嵁搴撹繛鎺�
//            pstmt = conn.prepareStatement(sql);       //鍙栧緱PreparedStatement瀵硅薄
//            pstmt.setInt(1, uId);                     //璁剧疆鍙傛暟
//            rs = pstmt.executeQuery();             //鎵цSQL鍙栧緱缁撴灉闆�
//            while (rs.next()) {
//                user = new User();
//                user.setUserId(rs.getInt("uId"));
//                user.setUserName(rs.getString("uName"));
//                user.setUserPass(rs.getString("uPass"));
//                user.setGender(rs.getString("gender"));
//                user.setHead(rs.getString("head"));
//                user.setRegTime(rs.getDate("regTime"));
//    return User;
//}else{
//    return null;
//}
//} catch (ClassNotFoundException | SQLException e) {
//e.printStackTrace();
//}finally{
//try{
//    rs.close();
//    ps.close();
//}catch(SQLException e){
//    e.printStackTrace();
//}
//}
//return null;
//}


}