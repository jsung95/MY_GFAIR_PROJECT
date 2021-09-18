<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

    <script>
        
        $(function() {

           $('#removeBtn').on('click', function() {
               
            //아래의 링크 형태의 요청은 무조건 GET 방식이므로 POST방식으로 보내야한다.
                // location.href = "/notice/remove?bno=<c:out value='${board.bno}'/>";
                
                let formObj = $('form'); //블록변수 => 지역변수
                formObj.attr('action', '/notice/remove');
                formObj.attr('method', 'POST');
                formObj.submit();

           });
           
           if($('#delete_file').attr('type') == 'checkbox'){
                $('#delete_file').on('click', function() {
                    if($(this).is(':checked')){
                        $(this).val('T');
                        $('#file').css('display','none');
                        
                    } else {
                        $(this).val('F');
                        $('#file').show();
                    }
                });
           }

           
           var is = "${board.notice_tf}";
           $(this).ready(function() {
                if(is == 'T') {
                    $('#checkbox').prop('checked', true);
                    $('#checkbox_hidden').attr('value', 'T');
                } else {
                    $('#checkbox').prop('checked', false);
                    $('#checkbox_hidden').attr('value', 'F');
                }
           });
		   
           $('#checkbox').on('click', function(){
        	   if($('#checkbox').is(':checked')){
            	   $('#checkbox_hidden').attr('value', 'T');
               } else {
                   $('#checkbox_hidden').attr('value', 'F');
               }   
           })
           

           
           
           $('#listBtn').on('click', function(){
        	  location.href = "/notice/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";  
           });





        });
    </script>    
</head>
<body>

    <form action="/notice/modify" method="POST" enctype="multipart/form-data">
    	<input type="hidden" name="bno" value="${board.bno}">
    	<input type="hidden" name="fid" value="${board.fid}">
    	<input type="hidden" name="public_tf" value="T">
    	
        <input type="hidden" name="currPage" value="${cri.currPage}">
        <input type="hidden" name="amount" value="${cri.amount}">
        <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
        
        제목 : <input type="text" name="title" value="${board.title}"><br>
        내용 : <textarea rows="10" cols="20" name="content">${board.content}</textarea><br>
        
        <!-- 작성자 : <input type="text" name="memberid" value="${board.memberid}"><br> -->

		공지로? : 
        <input type="checkbox" id="checkbox">
        <input type="hidden" id="checkbox_hidden" name="notice_tf" value="F">
        
        <br>
	
		파일 : <input type="file" name="file" id="file"><br>
		

	    <c:set var="fid" value="${board.fid}" />
	    <c:choose>
	        <c:when test="${empty fid}">
	            <p>첨부된 이미지(파일)가 없는 게시글 입니다.</p>
	            <input type="hidden" name="delete_file" value="F">
	        </c:when>
	        <c:otherwise>
	            기존 첨부파일명 : ${file.forname} <br>
	            기존파일 삭제 ? : <input type="checkbox" id="delete_file" name="delete_file" value="F">
	        </c:otherwise>
	
	    </c:choose>


        <input type="submit" value="수정">
        <button type="button" id="listBtn">목록으로</button>
        <button type="button" id="removeBtn">삭제하기</button>

    </form>
</body>
</html>