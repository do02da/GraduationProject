<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<main role="main">
		<div class="container">
			<div class="text-right">
				<a href="#this" class="list btn btn-primary" role="button">목록으로</a>
			</div>
			<table class="table table-bordered">
				<caption class="sr-only">게시글 상세</caption>
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">글 번호</th>
						<td>${map.B_ID }</td>
						<th scope="row">조회수</th>
						<td>${map.HIT_CNT }</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${map.WRITER }</td>
						<th scope="row">작성시간</th>
						<td>${map.CREA_DTM }</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${map.TITLE }</td>
					</tr>
					<tr>
						<td colspan="4">${map.CONTENTS }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</main>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
<script>
	$(document).ready(function() {
		$(".list").on("click", function(e) {
			e.preventDefault();
			fn_openBoardList();
		})
	})
	
	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoard.do' />");
		comSubmit.submit();
	}
</script>
</body>
</html>