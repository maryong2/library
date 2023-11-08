<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
    <title>QR �ڵ� ���� �� ����</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="qrcode"></div>
    <input type="text" id="url-front" style="width: 350px ; display: none" >
    <input type="text" id="text-input" placeholder="QR �ڵ忡 ���� Id�� �Է��ϼ���"  style="width: 150px"><br>
    <input type="text" id="url-full" placeholder="��ü url" style="width: 400px" readonly>
    <button id="generate-button">QR �ڵ� ����</button><br>
    <input type="text" id="file-name" placeholder="QR�ڵ� ���� �̸��� �Է��ϼ���">    
    <button id="save-button">QR �ڵ� ����</button>
    <button id="get-ids">id��������</button>
	<button id="auto-gen">�ڵ�����</button>
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
                 url: "/get-ids", // ��Ʈ�ѷ� �޼����� URL
                 type: "GET",
                 dataType: "json",
                 success: function (data) {
                     ids = data;
                     console.log(data);
                 },
                 error: function () {
                     alert("�����͸� �������� �߿� ������ �߻��߽��ϴ�.");
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

                // �� imageDataURL�� ������ �����ų� ���������� �ٿ�ε��ϴ� ������� �̹����� �����մϴ�.
                // ���⼭�� ���������� �̹����� �ٿ�ε��ϴ� ����� �����ݴϴ�.
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
                if (i === ids.length - 1) { // �迭 �ε����� ���̺��� �ϳ� ������ Ȯ��
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

