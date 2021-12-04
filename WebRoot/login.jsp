<form name="postForm" onsubmit="return check()" action="manage/doLogin.jsp" method="post">
<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
<body >
<form>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
            <th height="135" align="center" >登录（Login）</th>
        </tr>
        <tr>
            <td height="391" align="center" valign="top" class="dl_bg">
                    <table>
                        <tr>
                            <td>用户名：</td>
                            <td><input type="text" id="username" name="username"/></td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr>
                            <td>密&nbsp;&nbsp;&nbsp;码：</td>
                            <td><input type="password" id="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td>
								<input type="submit" type="button" value="登录">
                            </td>
                            <td>
                                <button type = "button" onclick="location.href='reg.jsp'">注册</button>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
