<%@ page language="java" pageEncoding="utf-8" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String head = request.getParameter("head");
    UserDao userDao = new UserDaoImpl();
    User user = new User();
    user.setUserName(username);
    user.setUserPass(password);
    user.setGender(gender);
    user.setHead(head);
    int num = userDao.addUser(user);
    if (num != 0){
        response.sendRedirect("../index.jsp");
    }else{
        response.sendRedirect("../reg.jsp");
    }
%>