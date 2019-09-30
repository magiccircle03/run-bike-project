<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="q_num" name="q_num" value="15" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
    	<h1>댓글리스트</h1>
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>



			$(document).ready(function(){
				
				list();		
				
				
			    
			});






//게시물 리스트
function list(){
    
	
	
	$.ajax({
		url : 'http://localhost:8080/runbike/rest/board/reply',
		type : 'GET',
		success : function(data){

			alert(data[i].q_num);
            
            var html = '';
            
            for(var i=0; i<data.length;i++){
            
                html += '글 번호:' + data[i].q_num +'<br>\n';
                html += '댓글 번호:' + data[i].rp_num +'<br>\n';
                html += '작성자      : ' + data[i].rp_writer +' <br>\n';
                html += '작성내용      : ' + data[i].rp_text +' <br>\n';
                html += '작성일자' + data[i].regdate +' <br>\n';
              
            }
            
            $('#commentList').html(html);
		}
	
        });
     }























</script>
 
</body>
</html>
