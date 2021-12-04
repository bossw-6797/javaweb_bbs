<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8" %>
<%
  TopicDao topicDao=new TopicDaoImpl();
  UserDao userDao=new UserDaoImpl();
  ReplyDao replyDao=new ReplyDaoImpl();
  BoardDao boardDao=new BoardDaoImpl();
  int boardId=Integer.parseInt(request.getParameter("boardId"));
  int topicId=Integer.parseInt(request.getParameter("topicId"));
  int p=Integer.parseInt(request.getParameter("page"));
  Board board=boardDao.findBoard(boardId);
  Topic topic=topicDao.findTopic(topicId);
  User topicUser=userDao.findUser(topic.getUserId());
  List listReply=replyDao.findListReply(p,topicId);
  int prep=p;
  int nextp=p;
  if(listReply.size()==10){
         nextp=p+1;
  }
  if(p>1){
     prep=p-1;
  }
  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
			&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
			<b><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></b></div>
			<br>
		<div id="apDiv4">
			<a href="reply.jsp?topicId=<%=topicId %>&boardId=<%=boardId %>"> <img src="image/huifu.jpg" boarder = "0"></a>
			<a href="post.jsp?boardId=<%=boardId%>"><img src="image/fabiao.jpg" board = "0"></a>
		</div>
		<div id="apDiv5">
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId %>">上一页</a> |
			<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId %>">下一页</a>
		</div>
		<div class="STYLE2" id="apDiv6">
			<tr>
			   <th>本页主题：<%=topic.getTitle() %></th>
			</tr>
			<tr>
			  <td>&nbsp</td>
			</tr>
		</div>
		<%
		  if(p==1){
	%>
		<div>
			<table  style="board-top-width:0px;table-layout:fixed"width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
				<tr>
				    <th style="width:20%">
				        <b><%=topicUser.getUserName()%></b><br/>
              <image src="<%=topicUser.getHead() %>"/><br/>
				        注册:<%=topicUser.getRegTime() %><br/>
				    </th>
				    <th>
				        <h4 align="left"><%=topic.getTitle() %></h4>
				        <div align="left"><%=topic.getContent() %></div>
				        <div align="left">发表：[<%=topic.getPublishTime() %>]&nbsp;
				                                               最后修改：[<%=topic.getModifyTime() %>]
				        </div>
				    </th>
				</tr>
			</table>
		</div>
		<%
	     }
	     for(int i=0;i<listReply.size();i++){
	       Reply reply=(Reply)listReply.get(i);
	       User replyUser=(User)userDao.findUser(reply.getUserId());
	    %>
	    <br/>

			<table width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
			<tr>
			    <th style="width:20% ">
			       <b><%=replyUser.getUserName() %></b><br/><br/>
              <image src="<%=replyUser.getHead() %>"/><br/>
			       注册：<%=replyUser.getRegTime() %><br/>
			    </th>
			    <th>
			       <h4 align="left"><%=reply.getTitle() %></h4>
			       <div align="left"><%=reply.getContent() %></div>
			       <div align="left">发表：[<%=topic.getModifyTime() %>] &nbsp;
			                                            最后修改:[<%=reply.getPublishTime() %>]
                      <a href="manage/doDeleteReply.jsp?boardId=<%=boardId%>&topicId=<%=topicId%>&replyId=<%=reply.getReplyId()%>">[删除]</a>
                      <a href="update.jsp?tipType=reply&boardId=<%=boardId%>&topicId=<%=topicId%>&replyId=<%=reply.getReplyId()%>">[修改]</a>
			       </div>
			    </th>
			 </tr>
		</table>
		<% } %>
		<div id="apDiv9">
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId %>">上一页</a> |
			<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId %>">下一页</a>
		</div>
		<br>
  </body>
</html>
