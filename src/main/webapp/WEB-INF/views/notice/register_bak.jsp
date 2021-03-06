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
        
        $(function() {
            $('#checkbox').on('click', function(){
         	   if($('#checkbox').is(':checked')){
             	   $('#checkbox_hidden').attr('value', 'T');
                } else {
                    $('#checkbox_hidden').attr('value', 'F');
                }   
            })
        

           $('#file').change(function(){
                if($('#file').val() != "") {
                    //============파일 확장자 검사==================//
                    var ext = $('#file').val().split('.').pop().toLowerCase(); //파일 확장자만 추출해서 ext 변수에 저장 
                    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1 ) {
                        alert('gif / png / jpg / jpeg 파일만 업로드 가능합니다.');
                        $('#file').val('');
                        return false;
                    }

                    //=========================================//
                    
                    //============파일 용량 검사==================//
                    var maxSize = 2 * 1024 * 1024; // 2 MB
                    var fileSize = $('#file')[0].files[0].size;
                    if(fileSize > maxSize) {
                        alert('첨부파일 업로드는 2MB 이내로 가능합니다.');
                        $('#file').val("");
                        return false;
                    }
                }
           });
           

        });
    </script>    
</head>
<body>
    <form action="/notice/register" method="POST" enctype="multipart/form-data">
       	<input type="hidden" name="currPage" value="${cri.currPage}">
       	<input type="hidden" name="currPage" value="${cri.amount}">
       	<input type="hidden" name="currPage" value="${cri.pagesPerPage}">
       	
       	<input type="hidden" name="memberid" value="${__LOGIN__.memberid}">
       	<input type="hidden" name="bname" value="공지사항">
       	<input type="hidden" name="public_tf" value="T">
       	<input type="hidden" name="reply_tf" value="F">
        <table>

            
            <tr>
                <th>title</th>
                <td><input type="text" name="title"></td>
            </tr>

            <tr>
                <th>content</th>
                <td><textarea name="content" cols="30" rows="10"></textarea></td>
            </tr>

            <tr>
                <th>파일첨부</th>
                <td><input type="file" name="file" multiple="multiple" id="file"></td>
            </tr>

            <tr>
                <th>공지로?</th>
                <td><input type="checkbox" id="checkbox"></td>
                <td><input type="hidden" id="checkbox_hidden" name="notice_tf" value="F"></td>
            </tr>
        
            <tr>
                <td><input type="submit" value="send"></td>
            </tr>




        </table>

    </form>
</body>
</html>