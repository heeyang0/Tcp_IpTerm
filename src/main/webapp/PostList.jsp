<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="EUC-KR">
    <title>깔깔 게시판</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }

        h2 {
            color: dark-gray;
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            font-size: 15px;
            background-color: #f5f5f5;
        }
        
        
        th {
         padding: 10px;
        border: 1px solid #ddd;
        background-color: #61CBC7;
        color: black;
        text-align: center;
    }

      td {
        border: 1px solid #ddd;
        text-align: center;
        background-color: #fff;
        text-align : left; /* 각 행의 배경색을 흰색으로 설정 */
    }


        th {
            background-color: #61CBC7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        button {
            background-color: #61CBC7;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin: 0px 0;
        }

        button:hover {
            background-color: #45A9A9;
        }
		.button-container {
		    text-align: right;
		    margin-top: 10px;
		}
		
		.button-container a {
		    display: inline-block;
		    padding: 10px 15px;
		    background-color: #61CBC7;
		    color: white;
		    text-decoration: none;
		    font-size: 16px;
		    border-radius: 5px;
		}
		
		.button-container a:hover {
		    background-color: #45A9A9;
		}
     .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a {
            color: #333;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            display: inline-block;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #61CBC7;
            color: white;
            border: 1px solid #61CBC7;
        }

        .pagination a:hover:not(.active) {
            backgsround-color: #ddd;
        }
        .search-container {
            margin-bottom: 20px;
        }

        .search-container select, .search-container input, .search-container button {
            margin-right: 10px;
            margin-bottom: 10px;
        }
     .search-container {
            margin-bottom: 20px;
        }

        .search-container select, .search-container input, .search-container button {
            margin-right: 10px;
            margin-bottom: 10px;
}

		.custom-select {
		    display: inline-block;
		    width: 120px;
		    padding: 10px;
		    font-size: 16px;
		    line-height: 1.5;
		    color: #333;
		    vertical-align: middle;
		    background-color: #fff;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    cursor: pointer;
		  
		}
		
		.custom-select:focus {
		    outline: none;
		    
		    border-color: #61CBC7;
		    box-shadow: 0 0 5px rgba(97, 203, 199, 0.5);
		}
		
				#searchInput {
		    width: 200px; 
		    padding: 10px;
		    font-size: 16px;
		    line-height: 1.5;
		    color: #333;
		    background-color: #fff;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    margin-right: 0;
		}

		
		.custom-select::after {
		    content: '\25BC';
		    position: absolute;
		    top: 50%;
		    right: 15px;
		    transform: translateY(-50%);
		    font-size: 16px;
		    color: #333;
		}
	
		.search-container select,
		.search-container input,
		.search-container button {
		    margin-right: 0; 
		    margin-bottom: 0;
		
		}
    </style>
    <script>
        function checkLogin() {
            var userId = '<%= session.getAttribute("_ID") %>';
            if (userId == null || userId.trim() === '') {
                showPopup();
            } else {
                window.location.href = "CreatePostUI.jsp";
            }
        }

        function showPopup() {
            alert("로그인이 필요합니다.");
            window.open("Login.jsp", "로그인", "width=400, height=450, top=10, left=10");
        }
        function truncateText(text, maxLength) {
            if (text.length > maxLength) {
                return text.substring(0, maxLength) + "...";
            }
            return text;
        }

     
        document.addEventListener("DOMContentLoaded", function () {
            var contentCells = document.querySelectorAll("#postTable td:nth-child(3)");
            contentCells.forEach(function (cell) {
                var originalText = cell.textContent; 
                var truncatedText = truncateText(originalText, 20);
                cell.textContent = truncatedText;
            });
        });

       
    </script>
</head>
<body>
    <h2>깔깔 게시판</h2>
    <div class="button-container">
        <a href="#" onclick="checkLogin(); return false;">등록</a>
    </div>

   <div class="search-container">
    <select id="searchType" class="custom-select">
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="nickname">작성자</option>
    </select>
    <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
    <button onclick="searchPosts()">검색</button>
</div>

    <table id="postTable">
       
        <tr>
            <th>순번</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
        </tr>
       
        <%
            try {
                request.setCharacterEncoding("euc-kr");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/blog", "root", "1234");

                String searchType = request.getParameter("searchType");
                String searchInput = request.getParameter("searchInput");

                String query = "SELECT * FROM post";
                if (searchType != null && searchInput != null) {
                    query += " WHERE " + searchType + " LIKE '%" + searchInput + "%'";
                }

                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                int count = 1;

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String nickname = rs.getString("nickname");
                    
                    out.println("<tr>");
                    out.println("<td>" + count++ + "</td>");
                    out.println("<td> <a href='PostDetail.jsp?_title=" + title + "&_content=" + content + "&_nickname=" + nickname + "'>" + title + "</a>");
                    out.println("<td>" + content + "</td>");
                    out.println("<td>" + nickname + "</td>");

                    out.println("</tr>");

                    

                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>게시물 목록을 불러오는 중 오류가 발생했습니다.</h3>");
            }
        %>
    </table>

    <script>
        function searchPosts() {
            var searchType = document.getElementById("searchType").value;
            var searchInput = document.getElementById("searchInput").value;

            window.location.href = "PostList.jsp?searchType=" + searchType + "&searchInput=" + searchInput;
        }
    </script>
</body>
</html>