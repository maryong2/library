<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<style>
    /* 열 너비 조절 */
    .table th, .table td {
      width: 33%; /* 열 너비 조절 (예: 3개의 열일 경우 각 열의 너비가 동일하도록 설정) */
    }
  </style>
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>
	<form action="stock-count" method="post">
		<input type="text" name="stock" value="start" style="display: none" /> 
		<input type="submit" value="조사시작" />
	</form>
	<form action="stock-count" method="post">
		<input type="text" name="stock" value="scan" style="display: none" /> <input type="submit" value="스캔" />
	</form>
	<div id="uncheck" class="bg-light rounded h-100 p-4" style="display: none">
		<c:set var="book_one" value="${book_one}" />
		<div class="table-responsive">
			<h6 class="mb-4">조사 대기</h6>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Book Id</th>
						<th scope="col">isbn</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${book_one}" var="book" varStatus="loopStatus">
						<tr>
							<th scope="row">${loopStatus.index + 1}</th>
							<td>${book.b_ID}</td>
							<td>${book.ISBN}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h6 id="uncheck-row"></h6>
		</div>

	</div>


	<div id="checked" class="bg-light rounded h-100 p-4" style="display: none">
		<c:set var="book_two" value="${book_two}" />
		<div class="table-responsive">
			<h6 class="mb-4">조사 완료</h6>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Book Id</th>
						<th scope="col">isbn</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${book_two}" var="book" varStatus="loopStatus">
						<tr>
							<th scope="row">${loopStatus.index + 1}</th>
							<td>${book.b_ID}</td>
							<td>${book.ISBN}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h6 id="inlib-row"></h6>
		</div>

	</div>
	<div id="onrent" class="bg-light rounded h-100 p-4" style="display: none">
		<c:set var="book_three" value="${book_three}" />
		<div class="table-responsive">
			<h6 class="mb-4">대여중</h6>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Book Id</th>
						<th scope="col">isbn</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${book_three}" var="book" varStatus="loopStatus">
						<tr>
							<th scope="row">${loopStatus.index + 1}</th>
							<td>${book.b_ID}</td>
							<td>${book.ISBN}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h6 id="onrent-row"></h6>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/chart/chart.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/tempusdominus/js/moment.min.js"></script>
	<script src="/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<script type="text/javascript">
		if ("${book_one}" != "[]") {
			$("#uncheck").css("display", "block");
			console.log("one")
		}
		if ("${book_two}" != "[]") {
			$("#checked").css("display", "block");
			console.log("ss")
		}
		if ("${book_three}" != "[]") {
			$("#onrent").css("display", "block");
			console.log("three")
		}
	</script>



</body>
</html>