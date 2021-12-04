
<%@ page language="java" pageEncoding="utf-8" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    UserDao userDao = new UserDaoImpl();
    User user = userDao.findUser(username);

    if (user!=null && user.getUserPass().equals(password)){
    	session.setAttribute("user",user);
        response.sendRedirect("../index.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }
%>