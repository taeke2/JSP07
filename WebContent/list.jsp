<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="testBoard.TestDAO" />
	<c:set var="totalPage" value="${dao.getTotalPage()}" />
	<c:set var="listDto" value="${dao.list(param.start)}" />

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>
		
		<c:choose>
			<c:when test="${listDto.size() != 0 }">
				<c:forEach var="dto" items="${listDto}">
					<tr>
						<td>${dto.num }</td>
						<td><a href="count.jsp?num=${dto.num }">${dto.title}</a></td>
						<td>${dto.pdate }</td>
						<td>${dto.count }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<th colspan="4">등록된 정보가 없습니다.</th>
				</tr>
			</c:otherwise>
		</c:choose>
		
		
		
		
		<tr>
			<td colspan="4" align="right">
				<c:choose>
					<c:when test="${param.start == null }">
						<c:set var="start" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="start" value="${param.start }" />
					</c:otherwise>
				</c:choose>
				
				
				
				
				<c:choose>
					<c:when test="${start > 1}">
						<button type="button"
							onclick="location.href='list.jsp?start=${start-1}'">이전</button>
					</c:when>
					<c:otherwise>
						<button type="button" disable="disable">이전</button>
					</c:otherwise>
				</c:choose> 
				
				
				
				
				<c:forEach begin="1" end="${totalPage}" step="1" var="cnt">
					<a href="list.jsp?start=${cnt}">[${cnt}]</a>
				</c:forEach> 
				
				
				<c:choose>
					<c:when test="${start < totalPage}">
						<button type="button"
							onclick="location.href='list.jsp?start=${start+1}'">다음</button>
					</c:when>
					<c:otherwise>
						<button type="button" disable="disable">다음</button>
					</c:otherwise>
				</c:choose> 
				
				
				<c:choose>
					<c:when test="${param.start == null }">
						1/${totalPage}
					</c:when>
					<c:otherwise>
						${param.start }/${totalPage}
					</c:otherwise>
				</c:choose>
				<button type="button" onclick="location.href='regForm.jsp'">등록</button>
			</td>
		</tr>
	</table>

</body>
</html>