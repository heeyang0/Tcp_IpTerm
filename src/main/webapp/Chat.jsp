<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시끌벅적 대화하기</title>
    <style>
        body {
            /* font-family: 'Arial', sans-serif;
            margin: 0; */
            background-color: #f0f0f0;
            color: #333;
            flex-direction: column;
            align-items: center;
            height: 100px;
        }

        h2 {
            color: #3498db;
            margin-bottom: 20px;
        }

        #chatArea {
            border: 1px solid #3498db;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
            background-color: #fff;
            border-radius: 8px;
            margin-bottom: 10px;
            width: 70%;
        }
	 a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        #messageInput {
            width: 70%;
            height: 50px;
            padding: 10px;
            margin-right: 5px;
            border: 1px solid #3498db;
            border-radius: 4px;
            color: #333;
            background-color: #fff;
            outline: none;
            resize: none;
        }

        #sendButton {
            padding: 10px 16px;
            border: none;
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
            outline: none;
            width: 20%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

    <h2>채팅</h2>

    <div id="chatArea"></div>

    <div style="display: flex; width: 70%;">
        <textarea id="messageInput" placeholder="메시지를 입력하세요..."></textarea>
        <button id="sendButton" onclick="sendMessage()">전송</button>
    </div>

    <script>
        var socket = new WebSocket("ws://localhost:8080/KC/ChatServer");
        var nickname = '<%= session.getAttribute("_NICKNAME") %>';

        socket.onmessage = function (event) {
            var message = event.data;
            $('#chatArea').append('<p>' + message + '</p>');
            $('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
        };

        function sendMessage() {
            var message = $('#messageInput').val();

            if (nickname.trim() !== "") {
                socket.send(nickname + ": " + message);
                $('#messageInput').val('');
                displayMessage(nickname + ": " + message);
            } else {
                alert("메시지를 보내기 전에 닉네임을 설정해주세요.");
            }
        }
        
        function displayMessage(message) {
            $('#chatArea').append('<p>' + message + '</p>');
            $('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
        }
    </script>
</body>
</html>
