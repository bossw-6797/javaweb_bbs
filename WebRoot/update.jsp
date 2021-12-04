<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="UTF-8"%>
<%
BoardDao boardDao = new BoardDaoImpl();
TopicDao topicDao = new TopicDaoImpl();
ReplyDao replyDao = new ReplyDaoImpl(); 

int boardId = Integer.parseInt(request.getParameter("boardId"));


Board board = boardDao.findBoard(boardId); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/xhtml/DTD/xhtml1-transitional.dtd">
<htmlxmlns = "http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
</head>
<head>
  	<meta http-equiv="Content-Type" content="text/html; charset = utf-8"/>
    <title>修改</title>
  </head>
  
  <body>
    	<div>
			<div align ="center" class="STYLE1">校园BBS</div>
		</div>
		<div>
			<br/>
			<div>
				&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
				<b><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></b>
			</div>
			<br/>
			
			<div>
				<form name="postForm" onsubmit="return check()" action="manage/doUpdateReply.jsp" method="post" >
					<input name="boardId" type="hidden" value="<%=request.getParameter("boardId")%>" />
					<input name="replyId" type="hidden" value="<%=request.getParameter("replyId")%>" />
					<input name="topicId" type="hidden" value="<%=request.getParameter("topicId")%>" />
					<div>
						<table width="80%" align="center" cellpadding="0" cellspacing="0"border="1">
							<tr>
								<td class="h" colspan="3" align="center"><b>修改回复</b></td>
							</tr>
			
							<tr class="tr3">
								<th width="10%"><b>标题</b></th>
								<th><input class="input" style="padding-left: 2px; font: 14px Tahoma" tabindex="1" size="70" name="title"></th>
							</tr>
			
							<tr class="tr3">
								<th valign=top>
								  <div><b>内容</b></div>
								</th>
								<th colspan=2>
									<div>	
									  <span><textarea style="WIDTH: 50%;" name="content" rows="30" cols="120" tabindex="2" ></textarea></span>
								  </div>
								  (不能大于:<font color="blue">1000</font>字)
							  </th>
							</tr>
						</table>
				    </div>		
				
					<div style="MARGIN: 15px 0px; TEXT-ALIGN: center">
						<input class="button" tabindex="3" type="submit" value="提 交"> 
						<input class="button" tabindex="4" type="reset"  value="重 置">
				    </div>
				</form>	
			</div>
		</div>	
  </body>
</html>