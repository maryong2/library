<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<a>å id =</a>
<a id="bookInfo"></a><br><hr>
<form action="return/check" method="post">
����Է� <input type="text" name= "employeeId" id = "employeeId" placeholder="1 or 2"/> <input type="submit" value="Ȯ��">

</form>
<script type="text/javascript">
let bookInfo=document.getElementById("bookInfo")
	bookInfo.textContent= `${bookId}`;

</script>

</body>
</html>