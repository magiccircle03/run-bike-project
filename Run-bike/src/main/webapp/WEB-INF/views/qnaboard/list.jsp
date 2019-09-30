<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
 <script src="<c:url value='/assets/js/layout.js'/>"></script>
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/assets/css/layout.css'/>">
    <style>

        
        #listshowbtn,#editpresetbtn,#delboardbtn,#replywritebtn{
        	width: 100px;
        	height: 30px;
        	border-radius:10px;
        }


        
        
   /*      div#detailFrame{
        	width:500px;
        	height:500px;
        } */



    </style>
</head>
<body>



<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->
			
	<div id="listheader">
			<h1>문의글 리스트</h1>
				<div style="text-align: right;"><a href="board/writeform">글쓰기</a></div>	    
			<table id="board_all" class="table"></table>
    <br/>
	</div>
	
	
	<div class="searchBox">
	
		<form>
			검색<br>
			<select name="stype">
				<option value="both">제목+작성자</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" name="keyword"> <input type="submit" value="검색">
		</form>
		
	</div>
	
	<c:if test="${pageviewData.totalCount>0}">
	<div id="pagingBox">
		<c:forEach begin="1" end="${pageviewData.pageTotalCount}" var="num">
			<%-- <div><a href="memberList?p=${num}">${num}</a> </div> --%>
			<div><a href="list?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a> </div> 
	</c:forEach>
		
	</div>
	</c:if>
			
	
	


	
	
	
	

<%-- 				<c:if test="${viewData.totalCount>0}"> --%>
<!-- 	<div id="pagingBox"> -->
<%-- 		<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num"> --%>
<%-- 			<%-- <div><a href="memberList?p=${num}">${num}</a> </div> --%>
<%-- 			<div><a href="list?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a> </div>  --%>
<%-- 		</c:forEach> --%>
		
<!-- 	</div> -->
<%-- 	</c:if> --%>
    		

			
			
<div id="editFrame" style="display: none" >
      <div class="page-header">
     <h3>문의글 수정</h3>
    </div>
         <hr>
         <div style="padding : 30px;">
         
         <form id="editForm" method="post" onsubmit="return false;">
         <div class="row">
          <div class="form-group">
            <input type="hidden" name="u_idx" id="eu_idx" value="${loginInfo.u_idx}">
            <input type="hidden" name="q_num" id="q_num" value="32">

             <label>글번호</label>
            <input type="text" name="q_num" id="eq_num" class="form-control" readonly />
             <label>작성자</label>
            <input type="text" name="q_writer" id="eq_writer" class="form-control" readonly />
           </div>
          </div>
             <div class="row">
          <div class="form-group">
               <label>제목</label>
            <input type="text" name="q_title" id="eq_title" class="form-control" required/>
          </div>
         </div>
          <div class="row">
           <div class="form-group">
            <label>내용</label>
            <textarea name="q_content" id="eq_content" class="form-control" rows="15" required ></textarea>
           </div>
      </div>
      <input type="submit" value="수정" onclick="editSubmit();">

 
         </form>
      </div>
      </div>




	
	 <div id="detailFrame" style="display: none">
		    <div class="page-header">
		    <hr>
			  <h3>문의글 상세보기</h3>
			 </div>
        	<hr> 
        	<div style="padding : 30px;">
        	
        	<form id="detailForm" onsubmit="return false;">
        	<div class="row">
	         <div class="form-group">
            <input type="hidden" name="u_idx" id="u_idx" value="${loginInfo.u_idx}">
            <!-- <input type="hidden" name="q_num" id="dq_num"> -->
             <label>글번호</label>
            <input type="text" name="q_num" id="dq_num" class="form-control" readonly />
             <label>작성자</label>
	           <input type="text" name="q_writer" id="dq_writer" class="form-control" readonly />
	          </div>
	         </div>
             <div class="row">
	         <div class="form-group">
	              <label>제목</label>
	           <input type="text" name="q_title" id="dq_title" class="form-control" readonly/>
	         </div>
	        </div>
          <div class="row">
	          <div class="form-group">
	           <label>내용</label>
	           <textarea name="q_content" id="dq_content" class="form-control" rows="15" readonly ></textarea>
	          </div>
	  		 </div>
	  		 <!-- <a href="boardreply.jsp?q_num="+q_num>답글달기</a> -->
        

        	</form>
   			</div>
   			</div>







			<!-- 답글달기 --> 
			 <div id="replyFrame" style="display: none">
		    <div class="page-header">
			  <h3>RE: 게시글 답글달기</h3>
			 </div>
        	<hr>
        	
        	
        	<div style="padding : 30px;">
        	
        	<form id="replyForm" method="post" onsubmit="return false;">
        	<div class="row">
	         <div class="form-group">
	         <%-- <input type="hidden" name="q_num" id="rpq_num" value="${param.q_num}"> --%>
	          <input type="hidden" name="u_idx" id="u_idx" value="${loginInfo.u_idx}">
	          <input type="hidden" name="q_num" id="rpq_num">
           
             <label>작성자</label>
	           <input type="text" name="q_writer" id="rpq_writer" class="form-control" placeholder="작성자를 입력하세요" required />
	          </div>
	         </div>
             <div class="row">
	         <div class="form-group">
	              <label>제목</label>
	           <input type="text" name="q_title" id="rpq_title" class="form-control" value="RE:" required/>
	         </div>
	        </div>
          <div class="row">
	          <div class="form-group">
	           <label>내용</label>
	           <textarea name="q_content" id="rpq_content" class="form-control" rows="15" placeholder="내용을 입력하세요" required ></textarea>
	          </div>
	  		 </div>
	  	
	  		 <%--   <button type="submit" id="replybtn" onclick="formSubmit('${param.q_num}')">등록</button> --%>
					<button type="submit" id="replybtn" onclick="replyformSubmit(q_num);">등록</button>
        	</form>
   			</div>
   			</div>
			



<button id="button">토글버튼</button>
 <div id="divToggle" style="display: none;">다시버튼 누르면 안보임</div>



				














<%-- <!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->
 --%>








<script>
	
	
	$(document).ready(function(){
				
				list();		

				$("#button").click(function (){ 
					$("#divToggle").toggle();
				});

				
				//String u_id = (String)session.getAttribute("u_id");
				
			});
		    
		    
	
	//수정하기 - 원래 데이터 불러오기
    function editPreSet(q_num){
        
		
    	
		
        disNone();
        
        $('#editFrame').css('display', 'block');
        
           $.ajax({
                url : 'http://localhost:8080/runbike/rest/board/'+q_num,
                type : 'GET',
                success : function(data){
                  	$('#u_idx').val(u_idx);
                    $('#eq_num').val(q_num);
                    $('#eq_writer').val(data.q_writer);
                    $('#eq_title').val(data.q_title);
                    $('#eq_content').val(data.q_content);
                }
            });

    }

  
  //수정하기(글번호를 찾아서 수정)
	  function editSubmit(){
	        

	 
	  		var q_num =$('#eq_num').val();       
	  		var q_writer = $('#eq_writer').val();
	  		var q_title = $('#eq_title').val();
	  		var q_content = $('#eq_content').val();
	  		var u_idx = ($('#eu_idx').val());
        
         $.ajax({
             url : 'http://localhost:8080/runbike/rest/board/'+q_num,
             type : 'POST',
             data : {q_num:q_num, q_writer:q_writer, q_title:q_title, q_content:q_content},   
             success : function(data){
             	
                 alert(data);
                 
                 if(data == 'success') {
                     alert('수정되었습니다.');
                     $('#editFrame').css('display', 'none');
                     list();
                 }
             },
             error : function(error){
                 alert(error);
             }
         });
         
         
         return false;
     
     
 		}
	
	

	
	
	
	
	
	
	


			
			
			//게시물 리스트
		    function list(num){
		        
		  
				
		    	$.ajax({
					url : 'http://localhost:8080/runbike/qnaboard/list',
					type : 'GET',
					success : function(data){
						
						var table = $('#board_all');
		                var html = '';
		                
		                

						html +='<thead class>';
    					html +='<tr bgcolor="#81BEF7">';
    					html +='<th>글번호</th>';
    					html +='<th>제목</th>';
    					html +='<th>idx</th>';
    					html +='<th>작성자</th>';
    					html +='<th>작성일</th>';
    					html +='<th>수정</th>';
    					html +='<th>삭제</th>';
    					html +='<th>답글리스트</th>';
    					html +='<th>답글작성</th>';
    					html +='</tr>';
    					html +='</thead>';
    					
    					
    					
    					
    					html+='<tbody>';

		                for(var i=0; i<data.length;i++){
		                	
		                	
		                
		                  	html += '<tr>';
		                    html += '<td>'+data[i].q_num+'</td>';
		                    html += '<td><a onclick="detaildata('+data[i].q_num+')" style="font-weight:bold;text-decoration:underline;font-size:18px;" >' +data[i].q_title+'</a></td>';
		                    html += '<td>' + data[i].u_idx +'</td>';		                   
		               		html += '<td> ' + data[i].q_writer +' </td>';
		                  
		                    
		                    //html += '<td>';
		                    html += '<td>'+data[i].regdate+'</td>';
		                  //회원 자신의 글만 수정,삭제 가능

		                    if(${loginInfo.u_idx} ==  data[i].u_idx ){
		                 	//html += '<button id="editpresetbtn" onclick="editPreSet('+ data[i].q_num +')">수정</button>';	
		                    html += '<td><a href="#" onclick="editPreSet('+data[i].q_num+')">수정</td>';
		                    }
		                    if(${loginInfo.u_idx} ==  data[i].u_idx || ${loginInfo.u_id == 'admin'}){
		                 	//html += '<button id="delboardbtn" onclick="del('+ data[i].q_num +')">삭제</button>';
		                    	 html += '<td><a href="#" onclick="del('+data[i].q_num+')">삭제</td>';
		                    }
		                   // html += '<button id="listshowbtn" onclick="getreplylist('+data[i].q_num+');">답글리스트</button>';
								html += '<td><a href="#" onclick="getreplylist('+data[i].q_num+')">답글리스트</td>';
							
							/* 관리자로 로그인시에만 답변작성버튼 생성 */
							if(${loginInfo.u_id == 'admin'}){	
							//html += '<button id="replywritebtn" onclick="replywrite('+data[i].q_num+')">답글작성</button>';
								html += '<td><a href="#" onclick="replywrite('+data[i].q_num+')">답글작성</td>';
							}
		                    //html += '</td>';
		                    
		                    html +='</tr>';
		                 	
		                    
		                   // html+= '<tbody>';
		                    
		                    
		                    html += '<tr>';
		                 	//if(${loginInfo.u_idx == data[i].u_idx}){
		                    
// 		                 	html += '<td><button id="editpresetbtn" onclick="editPreSet('+ data[i].q_num +')">수정하기</button></td>';	
// 		                    html += '<td><button id="delboardbtn" onclick="del('+ data[i].q_num +')">삭제하기</button></td>';
// 		                	//}
// 		                    html += '<td><button id="listshowbtn" onclick="getreplylist('+data[i].q_num+');">답변리스트</button></td>';
// //		                    html += '<button id="listhidebtn">리스트접기</button>';
							
// 							//관리자로 로그인시에만 답변작성버튼 생성
// 							//if(${loginInfo.u_id == 'admin'}){	

// 							html += '<td><button id="replywritebtn" onclick="replywrite('+data[i].q_num+')">답변작성</button></td>';

							//}
							
		                    html += '<td><div id="getreplylist'+data[i].q_num+'"></div></td>';
							html +='<tr>'
		                   	html += '<div id="writeForm'+data[i].q_num+'" class="writeForm col-6 mt-3" ></div>';
							html +='</tr>'
		                   	html +='</tr>';
							
		                      }
		               		html+= '</tbody>';
		               // $('#boardlist').html(html);
		                	table.html(html);
					}
				
		            });
		         }
			
			
		
			
			

			

			
			
			
			
			
			//답글 작성폼
 		    function replywrite(q_num){
 		    	
 		    	//var u_idx = "10";
 		    	
	        	var html = '';
		        html += '<div id="writeBox'+q_num+'" class="row" style="display:block; border:1px solid #bbb">';
		        html += '<strong><h3>답글쓰기</h3></strong>';
 		        html += '<form id="replywrite'+q_num+'" onsubmit="return false" method="post">';
 		       /*  html += '<input type="hidden" value="'+u_idx+'" id="u_idx" name="u_idx">'; */
 		        html += '<input type="hidden" value="10" id="u_idx" name="u_idx">';         //관리자만 작성가능
 		        html += '<input type="hidden" id="q_num" name="q_num" value="'+q_num+'">';
 		        html += '<div class="form-group col-lg-3"><label for="rp_writer">작성자</label><textarea class="form-control"  placeholder="관리자" id="rp_writer" name="rp_writer" col="100" readonly></textarea></div>';
 		        html += '<div class="form-group col-lg-11"><label for="rp_title">제목</label><textarea class="form-control"  placeholder="제목을 입력하세요." required id="rp_title" name="rp_title" col="100"></textarea></div>';
 		        html += '<div class="form-group col-lg-11"><label for="rp_text">내용</label><textarea class="form-control"  placeholder="내용을 입력하세요." required id="rp_text" name="rp_text" col="100"></textarea></div>';
		        html += '<div class="form-group center"><input type="submit" class="btn btn-lg btn-primary" value="작성완료" onclick="submitForm('+q_num+')"></div>';
 		        html += '</form>';
 		        html += '</div>';

 		        $('#getreplylist'+q_num).html(html);
 		    } 
			
	
 		    //답글 작성
			 function submitForm(q_num){
				 
			        console.log("submitForm : "+q_num);
			        
			        var formData = new FormData();
			        
			        console.log("submitForm idx: "+$('#u_idx').val());
			        
			      	formData.append("u_idx",$('#u_idx').val());
			        formData.append("rp_writer",$('#rp_writer').val());
			        formData.append("rp_title",$('#rp_title').val());
			        formData.append("rp_text",$('#rp_text').val());
			       	formData.append("q_num", $('#q_num').val());
			       
			        
			    
			        $.ajax({
			            type : 'POST',
			            url : 'http://localhost:8080/runbike/rest/reply',
			            enctype: 'multipart/form-data',
			            contentType : false,
			            processData : false,
			            data : formData,
			            success : function(data){
			            	
			                alert("답글작성이 완료되었습니다.");
			                $('#writeBox'+q_num).css('display','none');
			                getreplylist(q_num);
			            },
			            error : function(){
			                console.log("오류");
			            }
			        });
			        
    }
			 
	
			//답글리스트
			function getreplylist(q_num){
			        
			    	alert('글번호 :'+q_num);
			    	
			    	$.ajax({
						url : 'http://localhost:8080/runbike/rest/reply/reply/'+q_num,
						type : 'GET',
						success : function(data){
							if(data.length>0){
			  
			                var html = '';
							
			                for(var i=0; i<data.length;i++){
			                	//html += '<div id="divToggle">'
			                	html += '<div class="card">\n';
			                	 html += '<div id = "replylist_Box_Div'+data[i].q_num+'">';//이거추가함(버튼클릭시 show 또는 hide)
			                	 html += '<div id="writeBox'+q_num+'" class="row" style="display:block; border:1px solid #bbb">';  //이거추가함
			                	 html += '<hr>';
			                	 html += '<tr>';
			                	 html += '<td>원글번호 : ' + data[i].q_num +'</td>';	
			                	 html += '<td>답변글번호:' + data[i].rp_num +'</td>';		
			                	 html += '<td>답변글 제목:' + data[i].rp_title +'</td>';		
			                	 html += '<td>답변글 내용:' + data[i].rp_text +'</td>';		
			                	 html += '<td>답변글 작성자:' + data[i].rp_writer +'</td>';		
			                	 html += '<td>작성날짜:' + data[i].rp_regdate +'</td>';
			                	
			                	 html += '<td><button onclick="delreply('+ data[i].rp_num +')">삭제하기</button></td>';
			                	 html +='</tr>';
			                	 html += '</div>';
			                	 html += '</div>';
			                	html += '</div>';
			                	
			                }
			     
							
			                $('#getreplylist'+q_num).html(html);
			                
							  }else{
							        alert("답글이 없습니다.");
							       }
							  }
			    		
				});
			}

			
			
			
			
// 			function displayReplylistBox(q_num){


// 				if ($("#replylist_Box_Div"+q_num+":hidden")){

// 				        $("#replylist_Box_Div"+q_num).show();
// 				        $('#listbtn').text('접기'); 
				       

// 				}
// 				else if($("#replylist_Box_Div"+q_num+":visible")){

// 				        $("#replylist_Box_Div"+q_num).hide(); 
// 				        $('#listbtn').text('답글보기'); 
// 				}
// 				}
			
			

			
			
			//답글 작성
			function replyformSubmit(q_num) {
				
	        		
	            var formData = new FormData();
	           
	            formData.append('q_num', $('#q_num').val());
	            formData.append('rp_num', $('#rp_num').val());
	            formData.append('rp_title', $('#q_writer').val());
	            formData.append('rp_text', $('#q_title').val());
	            formData.append('rp_writer', $('#q_content').val());
	          
	                     
	            alert($('#replyForm').serialize());

	            
	            $.ajax({
	                url: 'http://localhost:8080/runbike/rest/reply',
	                type: 'POST',
	                processData: false,  
	                contentType: false,  
	                data: formData,
	                success : function(data){

	                        alert("글 등록이 완료되었습니다");
	                    	location.href="list.jsp";
	                }
	            });
	        }
	        
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			//답변하기 창으로 이동
		    //function boardreplywrite(q_num){
			//	location.href = "boardreply.jsp?q_num="+q_num;
			//}
			
			
			
			//게시글 상세보기(내용까지 보이도록)
			function detaildata(q_num){
				
				disNone();
				
				$('#detailFrame').css('display','block');
					
					$.ajax({
						url : 'http://localhost:8080/runbike/rest/board/detail/'+q_num,
						type : 'GET',
						 success : function(data){
			                    $('#dq_num').val(data.q_num);
			                    $('#dq_writer').val(data.q_writer);
			                    $('#dq_title').val(data.q_title);
			                    $('#dq_content').val(data.q_content);
			                }
					
					
					});
					
					
			}
			
			

		   
		  
		  function disNone() {
		    	
		    	 $('#editFrame').css('display', 'none');
		    	 $('#detailFrame').css('display', 'none');
		    	 $('#replyFrame').css('display', 'none');
		    }	
			
		
			
		    
		  //문의글삭제(원글 글 번호로)
		    function del(q_num){
		        
		        if(confirm('정말 삭제하시겠습니까?')){
		           $.ajax({
		                url : 'http://localhost:8080/runbike/rest/board/del/'+q_num,
		                type : 'DELETE',
		                success : function(data){
		                        if(data=='SUCCESS'){
		                        alert('삭제가 완료되었습니다');
		                        list();
		                    }		                    
		                },
		                error : function(error){
		                	alert('답글이 존재합니다.\n삭제할 수 없습니다. 관리자에게 문의하세요');
		                }
		            });
		           }
		    }
    
               
		//답글삭제(답글 글 번호로)
		function delreply(rp_num){
			
			if(confirm('정말 삭제하시겠습니까?')){
		           $.ajax({
		                url : 'http://localhost:8080/runbike/rest/reply/del/'+rp_num,
		                type : 'DELETE',
		                success : function(data){
		             
		                    if(data=='SUCCESS'){
		                        alert('답글삭제가 완료되었습니다');
		                        list();
		                    }          
		                }
		            });
		           
		           
		           }
		    }
			
		
    
			
		  
	
		  
    
</script>







</body>
</html>