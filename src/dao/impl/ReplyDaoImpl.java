/*
 * ReplyDao鐨勫疄鐜扮被
 */
package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ReplyDao;
import entity.Reply;

public class ReplyDaoImpl extends BaseDao implements ReplyDao {
    private Connection conn = null;              // 淇濆瓨鏁版嵁搴撹繛鎺�
    private PreparedStatement pstmt = null;              // 鐢ㄤ簬鎵цSQL璇彞
    private ResultSet rs = null;             // 鐢ㄦ埛淇濆瓨鏌ヨ缁撴灉闆�

    /**
     * 娣诲姞鍥炲
     *
     * @param reply
     * @return 澧炲姞鏉℃暟
     */
    public int addReply(Reply reply) {
        String sql = "insert into TBL_REPLY(title,content,publishTime,modifyTime,uId,topicId) values(?,?,?,?," + reply.getUserId() + "," + reply.getTopicId() + ")";
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 鍙栧緱鏃ユ湡鏃堕棿
        String[] parm = {reply.getTitle(), reply.getContent(), time, time};
        return this.executeSQL(sql, parm);               // 鎵цsql锛屽苟杩斿洖褰卞搷琛屾暟
    }

    /**
     * 鍒犻櫎鍥炲
     *
     * @param replyId
     * @return 鍒犻櫎鏉℃暟
     */
    public int deleteReply(int replyId) {
        String sql = "delete from TBL_REPLY where replyId=" + replyId;
        return this.executeSQL(sql, null);               // 鎵цsql锛屽苟杩斿洖褰卞搷琛屾暟
    }

    /**
     * 鏇存柊鍥炲
     *
     * @param reply
     * @return 鏇存柊鏉℃暟
     */
    public int updateReply(Reply reply) {
        String sql = "update TBL_REPLY set title=?, content=?, modifyTime=? where replyId=" + reply.getReplyId();
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 鍙栧緱鏃ユ湡鏃堕棿
        String[] parm = {reply.getTitle(), reply.getContent(), time};
        return this.executeSQL(sql, parm);               // 鎵цsql锛屽苟杩斿洖褰卞搷琛屾暟
    }


    /**
     * 鏌ユ壘鍥炲List
     *
     * @param page
     * @return 鏌ヨ缁撴灉
     */
    public List findListReply(int page, int topicId) {
        List list = new ArrayList();                  // 鐢ㄦ潵淇濆瓨鍥炲瀵硅薄鍒楄〃
        conn = null;                                  // 鐢ㄤ簬淇濆瓨鏁版嵁搴撹繛鎺�
        pstmt = null;                                  // 鐢ㄤ簬鎵цSQL璇彞
        rs = null;                                  // 鐢ㄦ埛淇濆瓨鏌ヨ缁撴灉闆�
        int rowBegin = 0;                               // 寮�濮嬭鏁帮紝琛ㄧず姣忛〉绗竴鏉¤褰曞湪鏁版嵁搴撲腑鐨勮鏁�
        if (page > 1) {
            rowBegin = 10 * (page - 1);                   // 鎸夐〉鏁板彇寰楀紑濮嬭鏁帮紝璁炬瘡椤靛彲浠ユ樉绀�10鏉″洖澶�
        }
        try {
            conn = this.getConn();                     // 寰楀埌鏁版嵁搴撹繛鎺�
            String sql = "select top 10 * from TBL_REPLY where topicId=" + topicId + " and replyId not in(select top " + rowBegin + " replyId from TBL_REPLY where topicId=" + topicId + "order by publishTime )order by publishTime";
            pstmt = conn.prepareStatement(sql);         // 寰楀埌PreparedStatement瀵硅薄
            rs = pstmt.executeQuery();                  // 鎵цsql鍙栧緱缁撴灉闆�

            /*  寰幆灏嗗洖澶嶄俊鎭皝瑁呮垚List  */
            while (rs.next()) {
                Reply reply = new Reply();              // 鍥炲瀵硅薄
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setModifyTime(rs.getDate("modifyTime"));
                reply.setTopicId(rs.getInt("topicId"));
                reply.setUserId(rs.getInt("uid"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();                        // 澶勭悊寮傚父
        } finally {
            this.closeAll(conn, pstmt, rs);             // 閲婃斁璧勬簮
        }
        return list;
    }

    /**
     * 鏍规嵁涓婚id鏌ヨ鍑鸿涓婚鐨勫洖澶嶆潯鏁�
     *
     * @param topicId 涓婚id
     * @return 鍥炲鏉℃暟
     */
    public int findCountReply(int topicId) {
        int count = 0;                    // 鍥炲鏉℃暟
        Connection conn = null;                // 鐢ㄤ簬淇濆瓨鏁版嵁搴撹繛鎺�
        PreparedStatement pstmt = null;                // 鐢ㄤ簬鎵цSQL璇彞
        ResultSet rs = null;                // 鐢ㄦ埛淇濆瓨鏌ヨ缁撴灉闆�
        String sql = "select count(*) from TBL_REPLY where topicId=" + topicId;
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();                        // 澶勭悊寮傚父
        } finally {
            this.closeAll(conn, pstmt, rs);             // 閲婃斁璧勬簮
        }
        return count;
    }

    /**
     * 鏍规嵁涓婚id锛屾煡鎵惧洖澶嶇殑淇℃伅
     *
     * @param replyId
     * @return 鍥炲
     */
    public Reply findReply(int replyId) {
        String sql = "select * from TBL_REPLY where replyId=?";
        Reply reply = null;
        try {
            conn = this.getConn();                // 鑾峰緱鏁版嵁搴撹繛鎺�
            pstmt = conn.prepareStatement(sql);    // 寰楀埌涓�涓狿reparedStatement瀵硅薄
            pstmt.setInt(1, replyId);              // 璁剧疆topicId涓哄弬鏁板��
            rs = pstmt.executeQuery();          // 鎵цsql锛屽彇寰楁煡璇㈢粨鏋滈泦

            /*  灏嗙粨鏋滈泦涓殑淇℃伅鍙栧嚭淇濆瓨鍒皉eply瀵硅薄涓紝寰幆鏈�澶氬彧浼氭墽琛屼竴娆�  */
            while (rs.next()) {
                reply = new Reply();              // 鍥炲瀵硅薄
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setModifyTime(rs.getDate("modifyTime"));
                reply.setUserId(rs.getInt("uid"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // 澶勭悊寮傚父
        } finally {
            this.closeAll(conn, pstmt, rs);       // 閲婃斁璧勬簮
        }
        return reply;
    }

}