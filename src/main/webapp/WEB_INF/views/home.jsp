<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Home Page</title>
</head>
<body>
Welcome <security:authentication property="principal.username"/> with
roles <security:authentication property="principal.authorities"/>

<br><br>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout">
</form:form>

<br>

<security:authorize access="hasRole('MANAGER')">
    <a href="${pageContext.request.contextPath}/manager">Go to Managers page</a><br><br>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
    <a href="${pageContext.request.contextPath}/admin">Go to Admin page</a>
</security:authorize>

</body>
</html>
