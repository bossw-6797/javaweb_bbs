<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="UTF-8"%>
<%
BoardDao boardDao = new BoardDaoImpl();
TopicDao topicDao = new TopicDaoImpl();

int boardId = Integer.parseInt(request.getParameter("boardId"));
int topicId = Integer.parseInt(request.getParameter("topicId"));
Topic topic = topicDao.findTopic(topicId);
Board board = boardDao.findBoard(boardId); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/xhtml/DTD/xhtml1-transitional.dtd">
<htmlxmlns = "http://www.w3.org/1999/xhtml">
<head>
  	<meta http-equiv="Content-Type" charset = utf-8"/>
    <title>回帖</title>
	

  </head>
  
  <body>
    	<div>
<table>
    <tr>
        <td><h1>校园BBS</h1></td>
    </tr>
</table>
<form action="manage/doReply.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
            <th height="135" align="center" >回帖（Reply）</th>
        </tr>
        <tr>
            <td height="391" align="center" valign="top" class="dl_bg">
                    <table>
           <tr>
            <td>标题</td>
            <td><input type="text"name="title" id="title"/></td>
        </tr>
        <tr>
            <td>内容</td>
            <td><textarea rows="5" cols="21"name="content" id="content"></textarea></td>
        </tr>
        <tr>
            <td>
            <input type="hidden" value=<%=boardId %> id="boardId" name="boardId">
            <input type="hidden" value=<%=topicId %> id="topicId" name="topicId">
            </td>
            <td>（不能大于：1000字）</td>
        </tr>
                    </table>
            </td>
        </tr>
    </table>
					<div style="MARGIN: 15px 0px; TEXT-ALIGN: center">
						<input class="button" tabindex="3" type="submit" value="提 交"> 
						<input class="button" tabindex="4" type="reset"  value="重 置">
				    </div>
				    </form>
  </body>
</html>