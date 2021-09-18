<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

    <script>
        

    </script>    
</head>
<body>
	<h1>답글달기</h1>
    <form action="/notice/answer" method="POST">
       	<input type="hidden" name="currPage" value="${cri.currPage}">
       	<input type="hidden" name="currPage" value="${cri.amount}">
       	<input type="hidden" name="currPage" value="${cri.pagesPerPage}">
       	
       	
       	<%-- <input type="hidden" name="bno" value="${board.bno}"> --%>
       	<input type="hidden" name="bname" value="공지사항">
       	<input type="hidden" name="reproot" value="${board.reproot}">
       	<input type="hidden" name="repstep" value="${board.repstep}">
       	<input type="hidden" name="repindent" value="${board.repindent}">
       	<input type="hidden" name="public_tf" value="T">
       	<input type="hidden" name="reply_tf" value="T">
       	<input type="hidden" name="memberid" value="${__LOGIN__.memberid}">
       	<input type="hidden" name="notice_tf" value="F">
        <table>

            
            <tr>
                <th>title</th>
                <td><input type="text" name="title" value="${board.title}"></td>
            </tr>

            <tr>
                <th>content</th>
                <td><textarea name="content" cols="30" rows="10"></textarea></td>
            </tr>

            <tr>
                <td><input type="submit" value="send"></td>
            </tr>




        </table>

    </form>
</body>
</html>