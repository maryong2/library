<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
å id=<a id = "bookInfo"></a><br>
<a id = "msg"></a><br>
<a href="sessionKill">Ȯ��</a>
</body>
<script type="text/javascript">
	let bookInfo=document.getElementById("bookInfo");
	bookInfo.textContent= `${bookId}`;
	let bookstate=document.getElementById("msg");
	bookstate.textContent=`${state}`;
</script>
</html>