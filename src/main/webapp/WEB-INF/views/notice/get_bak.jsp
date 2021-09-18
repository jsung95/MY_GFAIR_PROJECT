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
    		
            $('#listBtn').on('click', function() { 
               location.href = "/notice/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"; //이걸 가장많이쓴다.
            });
            
    		$('#modifyBtn').on('click', function(){
    			location.href="/notice/modify?bno=${board.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
    		});
    		
    		$('#answerBtn').on('click', function(){
    			location.href="/notice/answer?bno=${board.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
    		});
    		
    		if($('#memberid').val() == '') {
    			$('#recontent').attr('placeholder', '로그인 후 이용해주세요.');
    			$('#recontent').attr('readonly', true);
    			
    			$('#recontent, #reply_submitBtn').on('click', function(e){	
    				alert('로그인이 필요합니다.');
    				e.preventDefault();
    			});
    			
    		};
    		
    		
    		
    	});
    </script>

</head>
<body>

    <c:set var="fid" value="${board.fid}" />
    <c:choose>
        <c:when test="${empty fid}">
            <p>첨부된 이미지가 없는 게시글 입니다.</p>
        </c:when>
        <c:otherwise>
            <img src="/notice/load_img?fid=${board.fid}" width="200px" height="auto" alt="게시글 이미지" id="board_img">
        </c:otherwise>

    </c:choose>

    
	<p>글번호 : ${board.bno}</p>
	<p>조회수 : ${board.readcnt}</p>
	<p>공지유무 : ${board.notice_tf}</p>
    <p>제목 : ${board.title}</p>
    <p>내용 : ${board.content}</p>
    <p>작성자 : ${board.memberid}</p>

    <c:set var="insert" value="${sessionScope.__LOGIN__}" />
    <c:choose>
        <c:when test="${insert.membertype eq '관리자'}">
        	<button type="button" id="modifyBtn">수정창으로</button>
            <button type="button" id="answerBtn">답글달기</button>
        </c:when>
        <c:otherwise>
            &nbsp;
        </c:otherwise>

    </c:choose>
    
    <button type="button" id="listBtn">목록으로</button>
    
    
    
    <c:forEach items="${reply}" var="reply">
        <fieldset>
            <legend>댓글들</legend>
            <p>댓글번호 : ${reply.reno}</p>
            <p>작성자 : ${reply.memberid}</p>
            <p>작성일 : ${reply.redate}</p>
            <p>내용 : ${reply.recontent}</p>
            <form action="/notice/removeReply" method="POST">
            	<input type="hidden" name="bno" value="${reply.bno}">
            	<input type="hidden" name="reno" value="${reply.reno}">
            	<input type="submit" value="delete">
            </form>
            
        </fieldset>
    </c:forEach>

    <form action="/notice/writeReply" method="POST">
    	<input type="hidden" name="bno" value="${board.bno}">
    	<input type="hidden" id="memberid" name="memberid" value="${__LOGIN__.memberid}">
    	<textarea id="recontent" name="recontent" rows="10" cols="30"></textarea>
    	<input type="submit" id="reply_submitBtn" value="댓글작성">
    </form>

</body>
</html>