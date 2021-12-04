<%--
  Created by IntelliJ IDEA.
  User: 19772
  Date: 2021/10/24
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="GBK" %>
<%
    if (session.getAttribute("user") !=null){
        session.removeAttribute("user");
    }
    response.sendRedirect("../index.jsp");
%>
