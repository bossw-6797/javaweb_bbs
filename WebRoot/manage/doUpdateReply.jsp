<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="UTF-8"%>
<%
  		ReplyDao replyDao = new ReplyDaoImpl();
  		request.setCharacterEncoding("UTF-8");
		int boardId = Integer.parseInt(request.getParameter("boardId")); 
		int topicId = Integer.parseInt(request.getParameter("topicId"));
		int replyId = Integer.parseInt(request.getParameter("replyId"));
		String title = request.getParameter("title");     
		String content = request.getParameter("content");     
		User user = (User)session.getAttribute("user");  
		if( user!=null && user.getUserId()==replyDao.findReply(replyId).getUserId()) { 
			Reply reply = new Reply();
			reply.setReplyId(replyId);
			reply.setTitle(title);
			reply.setContent(content);
			replyDao.updateReply(reply);                              
			response.sendRedirect("../detail.jsp?page=1&boardId="+boardId+"&topicId="+topicId);   
			return;
		} else {
			response.sendRedirect("../list.jsp");
		}
%>