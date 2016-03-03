<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 

session.setAttribute("guest", "");

out.print("<script>alert('退出成功!');location.href='index.jsp'</script>");
%>