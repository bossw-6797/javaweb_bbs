<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<html>

<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int replyId = Integer.parseInt(request.getParameter("replyId"));
	int topicId = Integer.parseInt(request.getParameter("topicId"));
	User user = (User)session.getAttribute("user");
	TopicDao topicDao = new TopicDaoImpl();
	Topic topic = new Topic();
	topic = topicDao.findTopic(topicId);
	ReplyDao replyDao = new ReplyDaoImpl();
	if(user!=null){
		Date date = new Date();
		Reply reply = new Reply();
		reply.setModifyTime(date);
		reply.setContent(content);
		reply.setReplyId(replyId);
		replyDao.deleteReply(replyId);
		response.sendRedirect("../detail.jsp?page=1&boardId=" + boardId + "&topicId=" + topicId);
		return;
	}else{	
		response.sendRedirect("login.jsp");
		}
%>
</html>