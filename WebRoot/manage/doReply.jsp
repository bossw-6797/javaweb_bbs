<%@ page language="java" pageEncoding="utf-8" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    ReplyDao replyDao = new ReplyDaoImpl();
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int topicId = Integer.parseInt(request.getParameter("topicId"));
    User user = (User)session.getAttribute("user");

    if (user!=null) {
        Reply reply = new Reply();
        reply.setTitle(title);
        reply.setContent(content);
        reply.setTopicId(topicId);
        reply.setUserId(user.getUserId());
        //发表时间和修改时间将有dao类生成
        replyDao.addReply(reply);
        response.sendRedirect("../detail.jsp?page=1&boardId="+ boardId + "&topicId="+topicId);
        return;
    }
    else {
        response.sendRedirect("../login.jsp");
    }
%>