<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>지페어 코리아</title>

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>

</head>

<script>
    $(function() {
        $('a.prev, a.next, a.end').on('click', function(e) {
            e.preventDefault();
            
            var paginationForm = $('#paginationForm');
            
            paginationForm.attr('action', '/notice/list');
            paginationForm.attr('method', 'GET');
            
            paginationForm.find('input[name=currPage]').val($(this).attr('href'));
            paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
            paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
            paginationForm.find('input[name=type]').val('${pageMaker.cri.type}');
            paginationForm.find('input[name=keyWord]').val('${pageMaker.cri.keyWord}');
            
            paginationForm.submit();
        });
    });
</script>

<style>
    #board {
        width: 1200px;

        margin-top: 20px;
        margin-bottom: 40px;
    }
    
    table {
    	width: 100%;
    }

    table, th, td {
        border: 1px solid rgb(201, 201, 201);
        border-collapse: collapse;
    }

    th {
        background-color: rgb(245, 245, 245);
        height: 50px;
        font-size: 20px;
        border-top: 3px solid #6f2b89;

    }
    td {
        height: 40px;
        font-size: 15px;
        text-align: center;
    }
    td:first-child {
        color: #005bbb;
    }

    caption {
        font-size: 16px;
        font-weight: bold;
        padding: 0;
    }

    #topmenu > li {
        float: left;
        text-align: center;
        line-height: 50px;
        list-style: none;

        width: 33%;
        height: 50px;
    }

    #regBtn {
        width: 150px;
        height: 40px;

        border: 0;

        font-size: 15px;
        font-weight: bold;

        color: white;
        background-color: red;

        cursor: pointer;
    }

    tr:hover {
        background-color: rgb(239, 253, 226);
    }

    a, a:link, a:visited {
        text-decoration: none;
        color: black;
        cursor: pointer;
    }


    td:nth-child(2) {
        text-align: left; 
        padding-left: 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }



    /* paging */
    #pagination {
        width: 95%;
        margin: 0 auto;
    }

    /* #pagination ul {
        width: 310px;
        height: 32px;
        margin: 0 auto;
        
    } */
    #pagination ul {
        display: flex;
        justify-content: center;

    }
    #pagination li {
        width: 30px;
        height: 30px;
        display: flex;

        border-left: 1px solid #999;
        border-top: 1px solid #999;
        border-bottom: 1px solid #999;
        box-sizing: border-box;

        text-align: center;
        line-height: 30px;
    }
    #pagination li:last-child {
        border-right: 1px solid #999;
    }

    /* #pagination li {
        float: left;

        width: 30px;
        height: 30px;

        border-left: 1px solid #999;
        border-top: 1px solid #999;
        border-bottom: 1px solid #999;
        box-sizing: border-box;

        text-align: center;
        line-height: 30px;

        list-style: none;
    }

    #pagination li:last-child {
        border-right: 1px solid #999;
    } */

    .prev, .next {
        width: 40px !important;
        
        color: white;
        background-color: rgb(232, 255, 217);
    }

    .currPage {
        height: 29px!important;
        color: white;
        background-color: rgb(255, 231, 251);
        border-bottom: 1px solid #999;
        box-sizing: border-box;
    }

    #mmw {
        display: block;
        width: 30px;
        height: 30px;
    }

    .notice td, .notice a {
        color: black;
        background-color: rgb(246, 246, 255);
        font-weight: bold;
    }

    #totalCount {
        margin-bottom: 10px;
    }

    #search_area {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    #write_btn {
        display: flex;
        justify-content: right;

        margin: 10px 0;
    }
    #write_btn a {
        display: block;
        
        width: 100px;
        height: 40px;

        line-height: 40px;
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
    }
</style>
<script>
    $(function(){
    	var tmp;
    	
        var subName = $('.subName').text();
        
        $('.chk').each(function(index,obj){
            var t = index;
            var o = $(this).text();
            console.log(t + ':' + o)
            if(o == subName) {
            	tmp = t;
            }
        });

        console.log(tmp)
        
        $('#parent').children().eq(tmp).children().css({
            'font-size': '18px',
            'font-weight':'bold',
            'background':'url(/resources/img/side_li_bg.jpg) no-repeat',
            'background-position': 'right center'
        });
        

    })//end jq
</script>
<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">고객센터</h2>
                <ul id="parent">
                    <li><a class="chk" href="/notice/list">공지사항</a></li>
                    <li><a class="chk" href="#">보도자료</a></li>
                    <li><a class="chk" href="#">질문게시판</a></li>
                    <li><a class="chk" href="#">자주묻는질문</a></li>
                    <li><a class="chk" href="#">고객의소리</a></li>
                    <li><a class="chk" href="#">자유게시판</a></li>
                    <li><a class="chk" href="#">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > 공지사항 </div>
                    <h2 class="subName">공지사항</h2>
                </div>
                <div class="contentIn">
                	
                    <div id="board">

                        <div id="tables">

                            <p id="totalCount">전체글 수 : ${pageMaker.totalAmount}</p>

                            <table>
                                <thead>
                                    <tr>
                                        <th scope="col" width="10%">번호</th>
                                        <th scope="col" width="*">제목</th>
                                        <th scope="col" width="10%">작성자</th>
                                        <th scope="col" width="15%">등록일</th>
                                        <th scope="col" width="10%">조회수</th>
                                    </tr>
                                </thead>
                
                                <c:forEach items="${list_notice}" var="notice">
                                <tbody>
                                    
                                    <tr class="notice">
                                        <td>공지</td>
                                        <td><a href="/notice/get?bno=${notice.bno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${notice.title}</a></td>
                                        <td>${notice.memberid}</td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.insert_ts}"/></td>
                                        <td>${notice.readcnt}</td>
                                    </tr>
                
                                </tbody>
                                </c:forEach>
                            
                                <%-- <c:set var="endNum" value="${pageMaker.totalAmount - (pageMaker.cri.currPage - 1) * pageMaker.cri.amount}"/> --%>
                                
                                <c:forEach items="${list}" var="board" varStatus="i">
                                <tbody>
                                    
                                    <tr>
                
                                        <td> <!-- 게시글 인덱스 No. -->
                                            ${pageMaker.totalAmount - (pageMaker.cri.currPage - 1) * pageMaker.cri.amount - i.index}
                                        </td>
                                        <td>
                                        	<c:forEach begin="1" end="${board.repindent}">
						                    	<%= "&nbsp;&nbsp;" %>
						                    </c:forEach>
					                    	<a href="/notice/get?bno=${board.bno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${board.title}</a>
                                        </td>
                                        <td>${board.memberid}</td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/></td>
                                        <td>${board.readcnt}</td>
                                    </tr>
                
                                </tbody>
                                </c:forEach>
                            </table>
                        
                            <c:set var="insert" value="${sessionScope.__LOGIN__}" />
                            <c:choose>
                                <c:when test="${insert.membertype eq '관리자'}">
                                    <div id="write_btn">
                                        <a href="/notice/register?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}">글쓰기</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    &nbsp;
                                </c:otherwise>
                        
                            </c:choose>

                            <div id="pagination">
                                <form id="paginationForm" action="">
                                    <input type="hidden" name="currPage">
                                    <input type="hidden" name="amount">
                                    <input type="hidden" name="pagesPerPage">
                                    <input type="hidden" name="type">
                                    <input type="hidden" name="keyWord">
                                    <ul>
                                        <!-- <c:if test="${pageMaker.prev}">
                                            <li class="prev"><a href="/notice/list"><<</a></li>
                                            <li class="prev"><a class="prev" href="${pageMaker.startPage - 1}"><</a></li>
                                        </c:if> -->
                                        <li class="prev"><a class="start" href="/notice/list"><<</a></li>
                                        <li class="prev"><a class="prev" href="${pageMaker.startPage}"><</a></li>
                                        
                                        
                                        <c:forEach 
                                            begin="${pageMaker.startPage}" 
                                            end="${pageMaker.endPage}" 
                                            var="pageNum">
                                        
                                            <li class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}">
                                                <a 
                                                id="mmw"
                                                class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}"
                                                href="/notice/list?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyWord=${pageMaker.cri.keyWord}"
                                                >
                                                ${pageNum}
                                                </a>
                                            </li>
                                        </c:forEach>
                                        
                                        <!-- <c:if test="${pageMaker.next}">
                                            <li class="next"><a class="next" href="${pageMaker.endPage}">></a></li>
                                            <li class="next"><a class="end" href="${pageMaker.realEndPage}">>></a></li>
                                        </c:if> -->
                                        <li class="next"><a class="next" href="${pageMaker.endPage}">></a></li>
                                        <li class="next"><a class="end" href="${pageMaker.realEndPage}">>></a></li>
                                        
                                        
                                    </ul>
                                </form>
                            
                            </div>
                
                            <ul id="search_area">
                                <li>
                                    <form action="/notice/list" method="GET" id="searchForm">
                                        <input type="hidden" name="currPage" value="1">
                                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                        <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
                                        
                                        <select name="type" id="search1">
                                            <option value="T" ${ ( "T" eq pageMaker.cri.type ) ? "selected" : "" }>제목</option>
                                            <option value="C" ${ ( "C" eq pageMaker.cri.type ) ? "selected" : "" }>내용</option>
                                            <option value="W" ${ ( "W" eq pageMaker.cri.type ) ? "selected" : "" }>작성자</option>
                                            <option value="TC" ${ ("TC" eq pageMaker.cri.type ) ? "selected" : ""}>제목+내용</option>
                                        </select>
                                        <input type="text" name="keyWord" class="search2" value="${pageMaker.cri.keyWord}">
                                        
                                        <button class="search1">Search</button>
                                    </form>
                                
                                </li>
                                
                            </ul>
                        </div>
                
                        
                    </div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>