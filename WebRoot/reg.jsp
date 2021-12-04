<form name="postForm" onsubmit="return check()" action="manage/doReg.jsp" method="post">
<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="login_bg" >
    <tr>
        <th height="135" align="center" >注册（Reg）</th>
    </tr>
    <tr>
        <td height="391" align="center" valign="top" class="dl_bg">

            <table>
                <tr>
                    <td align="right">用户名：</td>
                    <td><input type="text" name="username" id="username"/></td>
                </tr>
                <tr>
                    <td align="right">密&nbsp;&nbsp;&nbsp;码：</td>
                    <td><input type="password" name="password" id="password"/></td>
                </tr>
                <tr>
                    <td align="right">确认密码：</td>
                    <td><input type="password" name="password1" id="password1"/></td>
                </tr>
                    <tr>
                        <td align="right">头&nbsp;像</td>
                        <td><input type="file" value="上传" name="head" id="head"/></td>
                    </tr>
                <tr>
                    <td align="right">性别：</td>
                    <td>男<input type="radio" name="gender" value="1"/>
                        女<input type="radio" name="gender" checked="checked" value="2"/></td>
                </tr>
                <tr>
                    <td><input type="submit" type="button" value="注册"></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
</form>