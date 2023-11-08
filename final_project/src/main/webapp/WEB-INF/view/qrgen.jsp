<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
    <title>QR 코드 생성 및 저장</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="qrcode"></div>
    <input type="text" id="url-front" style="width: 350px ; display: none" >
    <input type="text" id="text-input" placeholder="QR 코드에 담을 Id를 입력하세요"  style="width: 150px"><br>
    <input type="text" id="url-full" placeholder="전체 url" style="width: 400px" readonly>
    <button id="generate-button">QR 코드 생성</button><br>
    <input type="text" id="file-name" placeholder="QR코드 파일 이름을 입력하세요">    
    <button id="save-button">QR 코드 저장</button>
    <button id="get-ids">id가져오기</button>
	<button id="auto-gen">자동생성</button>
    <script type="text/javascript">
        const qrcodeDiv = document.getElementById("qrcode");
        const urlFront = document.getElementById("url-front");
        const textInput = document.getElementById("text-input");
        const urlFull = document.getElementById("url-full");
        const textFileName = document.getElementById("file-name");
        const generateButton = document.getElementById("generate-button");
        const saveButton = document.getElementById("save-button");
        const getIds = document.getElementById("get-ids");
        const autoGen = document.getElementById("auto-gen");
		let ids = "";
		let i = 0;
        getIds.addEventListener("click",function () {
        	 $.ajax({
                 url: "/get-ids", // 컨트롤러 메서드의 URL
                 type: "GET",
                 dataType: "json",
                 success: function (data) {
                     ids = data;
                     console.log(data);
                 },
                 error: function () {
                     alert("데이터를 가져오는 중에 오류가 발생했습니다.");
                 }
             });
        });
        
        urlFront.value = window.location.href.split('qrgen')[0] + "/books?id="
        let qrcodeInstance;
		function makeURL(){
			urlFull.value= urlFront.value + textInput.value;
		}
        generateButton.addEventListener("click", function () {
            const text = urlFront.value + textInput.value;
            if (text) {
                qrcodeDiv.innerHTML = "";
                qrcodeInstance = new QRCode(qrcodeDiv, text);
                textFileName.value = text.split('?id=')[1];
            }
        });

        saveButton.addEventListener("click", function () {
            if (qrcodeInstance) {
                const canvas = qrcodeDiv.querySelector("canvas");
                const imageDataURL = canvas.toDataURL("image/png");

                // 이 imageDataURL을 서버로 보내거나 브라우저에서 다운로드하는 방식으로 이미지를 저장합니다.
                // 여기서는 브라우저에서 이미지를 다운로드하는 방법을 보여줍니다.
                const a = document.createElement("a");
                a.href = imageDataURL;
    			a.download ="qrcode.png"
                if(textFileName.value){
                a.download = textFileName.value+".png";
                textInput.value = null;
                }
                a.click();
                textInput.focus();
            }
        });
        
        autoGen.addEventListener("click", function() {
            let i = 0;
            let interval = setInterval(function() {
                textInput.value = ids[i];
                makeURL();
                if (i === ids.length - 1) { // 배열 인덱스가 길이보다 하나 작은지 확인
                    clearInterval(interval);
                    i = 0;
                } else {
                    i++;
                }
                generateButton.click();
                saveButton.click();
            }, 500);
        });

    </script>
</body>
</html>

