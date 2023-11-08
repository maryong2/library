<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<input type="text" id ="isbn" >
<input type="button" id = "go" value="check">
<input type="text" id="name">
<script type="text/javascript">

let go = document.getElementById("go");
let isbn = document.getElementById("isbn");
let name = document.getElementById("name");
go.addEventListener("click",() => {
	let urlId = "https://www.nl.go.kr/seoji/SearchApi.do?cert_key=461ef3112bc97ed275fbed101ea88fbabffae5fa94df34ee5a54dff44beb7c99&result_style=json&page_no=1&page_size=1&isbn="
			urlId += isbn.value;
 $.ajax({
           url: urlId, // 컨트롤러 메서드의 URL
           type: "GET",
           dataType: "json",
           success: function (data) {
        	   name.value = data.docs[0].TITLE
          	 console.log(data);
           },
           error: function () {
          	 alert("오류발생")
           }
       });
       })
</script>
</body>
</html>