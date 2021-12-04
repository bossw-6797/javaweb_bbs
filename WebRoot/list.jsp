
<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8" %>
<%
    TopicDao topicDao = new TopicDaoImpl();
    ReplyDao replyDao = new ReplyDaoImpl();
    UserDao userDao = new UserDaoImpl();
    BoardDao boardDao = new BoardDaoImpl();

    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int p = Integer.parseInt(request.getParameter("page"));
    List listTopic = topicDao.findListTopic(p,boardId);
    Board board = boardDao.findBoard(boardId);
    int prep = p;
    int nextp = p;
    if (listTopic.size() ==20){
        nextp = p+1;
    }
    if (p>1){
        prep = p-1;
    }
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-HTML-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv=Content-Type content = "text/html charset=utf-8">
    <title></title>
</head>
<body>
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
    <tr>
        <td><a href="index.jsp">论坛首页</a>
        </td>
    </tr>
</table>
<div>
			<br/>
			<div>
				&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
				<b><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></b>
			</div>
			<br/>
			<div>
			<table>
    			<tr>
        		<td><a href="post.jsp?boardId=<%=boardId %>"><img src="image/fabiao.jpg"></a></td>
    			</tr>
			</table>
			</div>
			<div>
				<a href="list.jsp?page=<%=prep%>&boardId=<%=boardId %>">上一页</a>
				|
				<a href="list.jsp?page=<%=nextp%>&boardId=<%=boardId %>">下一页</a>
			</div>
			<div class="t">
				
				<table width="100%" height="503" border="1" cellpadding="0" cellspacing="0">
					<tr>
						
					</tr>
					<tr class="tr2">
						<td>&nbsp;</td>
						<td style="WIDTH:80%" align="center">文章</td>
						<td style="WIDTH:10%" align="center">作者</td>
						<td style="WIDTH:10%" align="center">回复</td>
					</tr>
					<%
						for(int i=0;i<listTopic.size();i++){
						Topic topic = (Topic)listTopic.get(i);
						User user = userDao.findUser(topic.getUserId());
					%>
					<tr class="tr3">
						<td>
							<img src="image/board.jpg" border="0">
						</td>
						<td style="FONT-SIZE:15px">
							<a href="detail.jsp?page=1&boardId=<%=boardId %>&topicId=<%=topic.getTopicId() %>">
								<%=topic.getTitle()%>
							</a>
						</td>
						<td align="center">
							<%=user.getUserName()%>
						</td>

						<td align="center">
							<%=replyDao.findCountReply(topic.getTopicId())%>
						</td>
					</tr>
					<%
				}
					%>
				</table>
			</div>
			<div>
				<a href="list.jsp?page=<%=prep%>&boardId=<%=boardId %>">上一页</a>
				|
				<a href="list.jsp?page=<%=nextp%>&boardId=<%=boardId %>">下一页</a>
			</div>
		</div>
</body>
</html>
