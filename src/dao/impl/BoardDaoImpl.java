package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.BoardDao;
import entity.Board;

public class BoardDaoImpl extends BaseDao implements BoardDao {
	private Connection conn = null; // 用于保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集
	private HashMap map = new HashMap(); // 保存版块信息的Map
	private int parentId = 0; // 父版块id初始值为0，parentNo将作为map的key
	private List sonList = null; // 保存属于同一个父版块的一组子版块，将作为map的value

	/**
	 * 查找版块
	 * 
	 * @return 封装了版块信息的Map
	 */
	public Map findBoard() {
		String sql = "select * from TBL_BOARD order by parentId,boardId"; // 查询板块的sql语句
		try {
			conn = this.getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行sql取得结果集
			sonList = new ArrayList(); // 实例化

			/* 循环将版块信息封装成Map */
			while (rs.next()) {
				if (parentId != rs.getInt("parentId")) {
					map.put(new Integer(parentId), sonList); // 将上一组子版块保存到map中
					sonList = new ArrayList(); // 重新产生一个ArrayList对象，用于存放下一组子版块
					parentId = rs.getInt("parentId"); //为parentNo重新设值，用于map的新key值
				}
				Board board = new Board(); // 版块对象
				board.setBoardId(rs.getInt("boardId")); // 版块id
				board.setBoardName(rs.getString("boardName")); // 版块名称
				sonList.add(board); // 保存属于同一父版块的子版块
			}
			map.put(new Integer(parentId), sonList); // 保存将最后一个sonList
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			closeAll(conn, pstmt, rs); // 释放资源
		}
		return map;
	}

	/**
     * 根据版块id查找版块
     * @param boardId
     * @return
     */
    public Board findBoard(int boardId) {
        String sql  =  "select * from TBL_BOARD where boardId=" + boardId;  //查询板块的sql语句
        Board board =  null;                                       // 声明一个空的版块对象
        try {
            conn    =  this.getConn();                             // 得到数据库连接
            pstmt   =  conn.prepareStatement(sql);                 // 得到PreparedStatement对象
            rs      =  pstmt.executeQuery();                       // 执行sql取得结果集
            while( rs.next() ) {
                board = new Board();                               // 实例化版块对象
                board.setBoardId( rs.getInt("boardId") );           // 版块id
                board.setBoardName( rs.getString("boardName") );    // 版块名称
                board.setParentId( rs.getInt("parentId") );         // 父版块id
                return board;
            }
        } catch ( Exception e ) {
            e.printStackTrace();                                    // 处理异常
        } finally {
            closeAll(conn,pstmt,rs);                                // 释放资源
        }
        return null;
    }
}