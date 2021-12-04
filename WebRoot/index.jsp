<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8" %>
<%
    BoardDao boardDao = new BoardDaoImpl();
    Map mapBoard = boardDao.findBoard();
    TopicDao topicDao = new TopicDaoImpl();
    UserDao userDao = new UserDaoImpl();


//     int boardId = Integer.parseInt(request.getParameter("boardId"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%-- <a href="list.jsp?page=1&boardId = <%=boardId %>"><%=board.getBoardName() %></a> --%>
<%-- <a href = "detail.jsp?page = 1&boardId = <%= boardId %>&to[ocId=<%=topic.getTopicId() %>"> --%>

</a>
<head>
    <meta charset="utf-8">
</head>
<div>
<table>
    <tr>
        <td><h1>校园BBS</h1></td>
    </tr>
</table>
<%if (session.getAttribute("user")==null){%>
<table>
    <tr>
        <td>您尚未<a href="login.jsp">登录|</a>
            <a href="reg.jsp">注册|</a>
        </td>
    </tr>
</table>
<%}else{
    User loginUser = (User) session.getAttribute("user");
%>
<table>
    <div class="h">
        你好：<%=loginUser.getUserName()%>|<a href="manage/doLogout.jsp">登出</a>
    </div>
    <%}%>
		<div id="apDiv3">
			<table width="100%" height="503" border="1" cellpadding="0" cellspacing="0" >
				<tr>
					<td colspan="2" align="left" valign="middle">
						<span class="STYLE4" >论坛</span>
					</td>
					<td width="5%" class="STYLE4">
						主题
					</td>
					<td width="45%" class="STYLE4">
						最后发表
					</td>
				</tr>

				<!-- 主板块 -->
				<%
				List listMainBoard = (List)mapBoard.get(new Integer(0));
				for(int i=0;i<listMainBoard.size();i++)
				{
					Board mainBoard = ((Board)listMainBoard.get(i));
				%>
				<tr class="tr3">
					<td colspan="4">
						<%=mainBoard.getBoardName() %>
					</td>
				</tr>
				<!-- 子版块 -->
				<%
				List listSonBoard = (List)mapBoard.get(new Integer(mainBoard.getBoardId()));
				for(int j=0 ; j<listSonBoard.size();j++)
				{
					Board sonBoard = (Board)listSonBoard.get(j);
					Topic topic = new Topic();
					User user = new User(); 
					
					int boardId = sonBoard.getBoardId();
					List listTopic  = topicDao.findListTopic(1, boardId);
					if(listTopic!=null&&listTopic.size()>0){
						topic = (Topic)listTopic.get(0);
						user = userDao.findUser(topic.getUserId());
					}
				%>
				<tr class="tr3">
					<td width="5%">
						&nbsp;
					</td>
					<th align="left">
						<img src="image/board.gif" alt="">
						<a href="list.jsp?page=1&boardId=<%=boardId %>">
							<%=sonBoard.getBoardName() %>
						</a>
					</th>
					<td align="center">
						<%=topicDao.findCountTopic(sonBoard.getBoardId())%>
					</td>
					<th>
						<span>
							<a href="detail.jsp?page=1&boardId=<%=boardId %>&topicId=<%=topic.getTopicId() %>">
								<%=topic.getTitle() %>
							</a>
						</span>
						<br/>
						<span><%=user.getUserName() %></span>
						<span class="gray">
							[<%=topic.getPublishTime() %>]
						</span>
					</th>
				</tr>
				<%
				}
			}
				%>
			</table>
		</div>
    </body>
</html>
