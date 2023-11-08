<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="EUC-KR">
<!-- 문자 인코딩 설정 -->
<title>문서 제목</title>
<link rel="stylesheet" rel="preload" as="style" onload="this.rel='stylesheet';this.onload=null" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
<link rel="stylesheet" rel="preload" as="style" onload="this.rel='stylesheet';this.onload=null" href="https://unpkg.com/normalize.css@8.0.0/normalize.css">
<link rel="stylesheet" rel="preload" as="style" onload="this.rel='stylesheet';this.onload=null" href="https://unpkg.com/milligram@1.3.0/dist/milligram.min.css">
</head>
<body>
	<a>책 id =</a>
	<a id="bookInfo"></a>
	<br>
	<hr>
	<main class="wrapper" style="padding-top: 2em" id="qr_camera">

		<section class="container" id="demo-content">
			<div>
				<a class="button" id="resetButton" style="display: none">switching</a>
			</div>

			<div>
				<video id="video" width="90%" height="60%" style="border: 1px solid gray"></video>
			</div>

			<div id="sourceSelectPanel" style="display: none">
				<label for="sourceSelect">Change video source:</label> <select id="sourceSelect" style="max-width: 400px">
				</select>
			</div>

			<label>Result:</label>
			<pre>
				<code id="result"></code>
			</pre>
			<a id="link-url"></a>
	</main>
	<button id="qrbutton" style="display: none;">qr스캔</button>
	<div id="userSelect" style="display: none;">


		<form id="myForm" action="" method="post">
			
			<input type="text" id="isBook" name="id" style="display: none">
			<button type="submit" id="rent" onclick="setAction('rent')">대여</button>
			<button type="submit" id="extension" onclick="setAction('extension')">연장</button>
			<button type="submit" id="assignment" onclick="setAction('assignment')">양도</button>
			<button type="submit" id="return" onclick="setAction('return')">반납</button>
		</form>



	</div>
	<script type="text/javascript" src="https://unpkg.com/@zxing/library@latest/umd/index.min.js"></script>

	<script type="text/javascript">
 	let userSelect = document.getElementById("userSelect"); 
 	let camera = document.getElementById("qr_camera");
 	let bookInfo = document.getElementById("bookInfo");
 	let isBook = document.getElementById("isBook");
 	let qrbutton = document.getElementById("qrbutton");
 	let restart = document.getElementById("resetButton");
 	let i=0;
 	if (`${bookId}`){
 		bookInfo.textContent= `${bookId}`;
 		isBook.value= `${bookId}`
 		userSelect.style.display= "block"	
 		camera.style.display= "none"
 		
 	}else{
 		userSelect.style.display="none"	
 	 	camera.style.display="block"

 		window.onload = function(){	qrbutton.click();}
 	}
 	

 	function setAction(action) {
 	    var form = document.getElementById("myForm"); 	  
 	    if (action === 'rent') {
 	        form.action = 'rent';
 	    } else if (action === 'extension') {
 	        form.action = 'extension';
 	    } else if (action === 'assignment') {
 	        form.action = 'assignment';
 	    } else if (action === 'return') {
 	        form.action = 'return';
 	    }
 	    form.submit();
 	}
 	

 	
  
 
 	qrbutton.addEventListener('click', function () {
     let selectedDeviceId;
     const codeReader = new ZXing.BrowserMultiFormatReader()
     console.log('ZXing code reader initialized')
     codeReader.listVideoInputDevices()
       .then((videoInputDevices) => {
    	   selectedDeviceId = videoInputDevices[i].deviceId
    	   let numOfCamera = videoInputDevices.length;
         
    	   document.getElementById('resetButton').style.display="block";
    	   
    	   document.getElementById('resetButton').addEventListener('click', () => {
    		   i++;
    		   codeReader.reset()
        	if(i == numOfCamera){
        		i = 0;
        		selectedDeviceId = videoInputDevices[i].deviceId
        	}else{
        		selectedDeviceId = videoInputDevices[i].deviceId
        	}
        	
        	 
        	 
        	
           
           //document.getElementById('result').textContent = '';
           
           codeReader.decodeFromVideoDevice(selectedDeviceId, 'video', (result, err) => {
               if (result) {
            	 document.getElementById('result').textContent = result.text
            	 bookInfo.textContent = result.text.split('?id=')[1];
                 isBook.value = result.text.split('?id=')[1];
                 userSelect.style.display="block"
                 //ajax사용
               }
               if (err && !(err instanceof ZXing.NotFoundException)) {
                 console.error(err)
                 document.getElementById('result').textContent = err
               }
             })
         })
         restart.click();
       })
       .catch((err) => {
         console.error(err)
       })
   })
 </script>

</body>
</html>