<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>count</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="testBoard.TestDAO"/>
	${dao.count(param.num) }
	<c:redirect url="list.jsp"/>
</body>
</html>