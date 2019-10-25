<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	h1{
		text-align:center;
	}
	

	table {
		table-layout:fixed;
		word-break:break-all;
	}

	
	#paging{
		width:80px;
		float:left;
	}
	
	#detailFrame,#editFrame{
		text-align:center;
		
	}
	#detailForm,#editForm{
		display: inline-block;
	}
	
	#editbtn{
		margin:auto;
	}
	#hidebtn{
		height:30px;
/* 		padding: 3px 10px; */
	}


    </style>
</head>
<body>


<!-- 해더 시작 -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 해더 끝 -->
				
				
				
	<!-- 문의글 전체 리스트, 페이징 포함 --> 

			<H1> 문의글 리스트</H1>
			<hr>
			<div id="list">		
	
			<table id="board_all"></table>			
<!-- 			<div id="searchBox"></div> -->
			
			</div>
		
			
	
			    <ul class="pagination justify-content-center">
			      <li class="page-item">
			        <a class="page-link" href="#" aria-label="Previous">
			          <span aria-hidden="true">&laquo;</span>
			        </a>
			      </li>
			      <li class="page-item">
			        <a class="page-link" href="#" aria-label="Next">
			          <span aria-hidden="true">&raquo;</span>
			        </a>
			      </li>
			    </ul>
 
		  
		  
		  

	
	

      
      
     <!-- 문의글 수정 폼 --> 	
	<div id="editFrame" class="container table-responsive" style="display: none" >
	      <div class="page-header">

	    	 <h3>문의글 수정</h3>
	      </div>
	       <hr>
	
	         <form id="editForm" method="post" onsubmit="return false;">
	
	            <input type="hidden" name="u_idx" id="eu_idx" value="${loginInfo.u_idx}">
	            
	          		 <!--  <input type="hidden" name="q_num" id="q_num" value="32"> -->
				<table id=editTable class="table">
					<tr>					
						<td id="title">글번호</td>
					  	<td style="width:50%"><input type="text" name="q_num" id="eq_num" class="form-control" readonly /></td>
			            <td id="title">작성자</td>
			            <td><input type="text" name="q_writer" id="eq_writer" class="form-control" readonly /></td>
			        </tr>
			        <tr>
			            <td id="title">제 목</td>
			            <td><input type="text" name="q_title" id="eq_title" class="form-control" required/></td>        
			        </tr>
			        <tr>
			            <td id="title"> 내 용</td>
			            <td><textarea name="q_content" id="eq_content" class="form-control" cols="70" rows="15" required ></textarea></td>        
			        </tr>
			        <tr>
			          	<td>&nbsp;</td>
			          	<td><input id="editbtn" type="submit" class="btn btn-primary" value="수정" onclick="editSubmit();"><button class="btn btn-secondary" onclick="canceledit('+q_num+')">취소</button></td>
			        </tr>		 
			    </table>    
	   		 </form>
       </div>
	
	      
      
      
      
      
      
      
      
      
	 <!-- 문의글 상세보기 -->
	 <div id="detailFrame" class="container table-responsive" style="display: none">
		     <div class="page-header">
		   	 <hr>
			 	 <h3>문의글 상세보기</h3>
			 	 <button id="hidebtn" class="btn btn-outline-dark">상세보기 접기</button>
			 </div>
        	  <hr> 
        	
        	<form id="detailForm" onsubmit="return false;">
        	<!-- <div class="card"> -->
	        	<div class="row">
		         <div class="form-group">
	            <input type="hidden" name="u_idx" id="u_idx" value="${loginInfo.u_idx}">
	            <!-- <input type="hidden" name="q_num" id="dq_num"> -->
	            
		            <table id=detailTable class="table">
						<tr>
							<td id="title">글번호</td>
						  	<td style="width:50%"> <input type="text" name="q_num" id="dq_num" class="form-control" readonly /></td>
				            <td id="title">작성자</td>
				            <td><input type="text" name="q_writer" id="dq_writer" class="form-control" readonly /></td>
				        </tr>
				            <tr>
				            <td id="title">제 목</td>
				            <td><input type="text" name="q_title" id="dq_title" class="form-control" readonly/></td>
				            <td id="title">작성일자</td>
				            <td><input type="text" name="regdate" id="dregdate" class="form-control" readonly/></td>               
				        </tr>
				        <tr>
				            <td id="title"> 내 용</td>
				            <td><textarea name="q_content" id="dq_content" class="form-control" cols="70" rows="15" readonly ></textarea></td>     				        	
				        </tr>
			        
		    		</table> 
		    		 
	    		</div>
	    		</div>
    		</form>
    </div>
  		


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 -->





<script>
	
	
	$(document).ready(function(){

		
				list();		
				
				/* 상세보기 접기 버튼 */
				$(hidebtn).click(function(){
					$(detailFrame).hide();
				});
				

				
				
		});
		    


	
	
	
	
  

 function list(pgNum){
			
			//alert(num);
			$.ajax({
				//url : 'http://localhost:8080/runbike/rest/board/list',
				url : './rest/board/list',
				type : 'GET',
				data : {page:pgNum, stype:$('#stype').val(), keyword:$('#keyword').val()},
				success : function(data){
					
					var html = '';
					
					var table = $('#board_all');
					html +='<div class="container table-responsive">';
					html +='<table class="table table-sm">'

					html +='<tr class="table-primary">';
					html +='<td style="width:8%">글번호</td>';
					html +='<td style="width:20%">제목</td>';
// 					html +='<td>idx</td>';
					html +='<td style="width:10%">작성자</td>';
					html +='<td style="width:10%">작성일</td>';
					html +='<td style="width:10%">수정</td>';
					html +='<td style="width:10%">삭제</td>';
					html +='<td style="width:15%">답글리스트</td>';
					if(${loginInfo.u_id == 'admin'}){	
						html +='<td style="width:15%">답글작성</td>';
					}else{
						html+= '<td>&nbsp;</td>';
					}
					html +='</tr>';


					var list = data.boardList;    //BoardListService의 boardList
					for(var i = 0; i < list.length; i++){
						
						
						var q_num = list[i].q_num;
						var u_idx = list[i].u_idx;
						var q_title = list[i].q_title;
						var q_writer = list[i].q_writer;
						var q_content = list[i].q_content;
						var regdate = list[i].regdate;
						
						
						html += '<tr>';
						html += '<td>'+q_num+'</td>';
						html += '<td><a onclick="detaildata('+q_num+')" style="font-weight:bold;text-decoration:underline;font-size:18px;">'+q_title+'</a></td>';
// 						html += '<td>'+u_idx+'</td>';
						html += '<td>'+q_writer+'</td>';
						html += '<td>'+regdate+'</td>';
						
						
	
	
						//td안의 값이 null일때 공백(&nbsp;)입력
						if(${loginInfo.u_idx} == u_idx){
			           		html += '<td><a class="btn btn-outline-primary" href="#" onclick="editPreSet('+q_num+')">수정</td>';
			            }else{
			            	html+= '<td>&nbsp;</td>';
			            }												
						if(${loginInfo.u_idx} == u_idx || ${loginInfo.u_id == 'admin'}){
			            	html += '<td><a class="btn btn-outline-primary" href="#" onclick="del('+q_num+')">삭제</td>';
			            }else{
			            	html+= '<td>&nbsp;</td>';
			            }						
							html += '<td><a class="btn btn-primary" href="#" onclick="getreplylist('+q_num+')">답글리스트</td>';						
						if(${loginInfo.u_id == 'admin'}){	
							html += '<td><a class="btn btn-primary" href="#" onclick="replywrite('+q_num+')">답글작성</td>';
						}else{
							html+= '<td>&nbsp;</td>';
						}
						
						
						html +='</tr>';
						html += '<tr>';
		                html += '<td colspan=9><div id="getreplylist'+q_num+'"></div></td>';
		                html +='</tr>';
						html +='<tr>'
		               	html += '<td colspan=9><div id="writeForm'+q_num+'"></div></td>';
						html +='</tr>'

		               
		                
					}
						

					      
// 					      html += '<tr>';
// 					      html += '<div class="searchBox">';
// 					      html += '<form id="searchBox">';
// 					      html += '<select name="stype"><option value="q_title">제목</option><option value="q_writer">작성자</option></select>';
// 					      html += '<input type="text" name="keyword">';
// 					      html += '<input type="submit" value="검색" href="#" onclick="list('+pgNum+')">';				
// 					      html += '</form>';
// 					      html += '</div>';
// 					      html += '</tr>';
					      
						  html +='</table>';	 
					      table.html(html);
					      
					     

							html +='</div>';
							
						var paging = '';
						
						paging +='<a class="page-link" href="qnaboard"><span>처음</span></a>';
						for(var j=1 ; j<data.pageTotalCount+1 ; j++){
							 
							paging += '<li class="page-item"><a class="page-link" href="#" onclick="list('+j+')">'+j+'</a></li>';

						
						}
						
					
						$('#list').html(html);
						$('.pagination').html(paging);
						
					}
				});
			}
				


	  
		
		//수정하기 - 원래 데이터 불러오기
	    function editPreSet(q_num){

	        disNone();
	        
	       // alert($('#eu_idx').val());
	        
	        $('#editFrame').css('display', 'block');
	        
	           $.ajax({
	                //url : 'http://localhost:8080/runbike/rest/board/'+q_num,
	                url : './rest/board/'+q_num,
	                type : 'GET',
	                success : function(data){
	                  	//$('#eu_idx').val(u_idx);   //바뀌는 값이 아니므로, 한번 더 바꿔줬기때문에 중복으로 오류가 뜸
	                    $('#eq_num').val(q_num);
	                    $('#eq_writer').val(data.q_writer);
	                    $('#eq_title').val(data.q_title);
	                    $('#eq_content').val(data.q_content);
	                }
	            });
	    }

	  
	  //수정하기(글번호를 찾아서 수정)
		  function editSubmit(q_num){
		 
		  		var q_num =$('#eq_num').val();       
		  		var q_writer = $('#eq_writer').val();
		  		var q_title = $('#eq_title').val();
		  		var q_content = $('#eq_content').val();
		  		var u_idx = $('#eu_idx').val();
		  			        
	         $.ajax({
	             //url : 'http://localhost:8080/runbike/rest/board/'+q_num,
	             url : './rest/board/'+q_num,
	             type : 'POST',
	             data : {u_idx:u_idx, q_num:q_num, q_writer:q_writer, q_title:q_title, q_content:q_content},   
	             success : function(data){

	                 if(data == 'success') {
	                	 
	                	 msg = "수정하시겠습니까?";
		 					if(confirm(msg)!=0){
			                     alert('수정이 완료되었습니다.');
			                     $('#editFrame').css('display', 'none');
			                     list();					
		 					}else{
		 						$("#editFrame").show();
		 					}
	                 }
	             },
	             error : function(error){
	            	 alert(error);
	            	 console.log("error"+error);
	             }
	         });	         	         
	         return false;	     
	 		}
	  

		    
			//수정 폼 접기 버튼(확인 or 취소 alert)
			function canceledit(q_num){
				
				if($("#editFrame:visible")){
					msg = "수정을 취소하시겠습니까?";
					if(confirm(msg)!=0){
						$("#editFrame").hide();
					}else{
						$("#editFrame").show();
					}
				}
			}
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
		//답글 작성폼
	    function replywrite(q_num){
	    	

      	var html = '';
      	
      		html +='<div class="container table-responsive">';
	        html += '<div id="writeBox'+q_num+'" class="row" style="display:block; border:1px solid #bbb">';
	        html += '<h3>답글작성</h3>';
	        html += '<form id="replywrite'+q_num+'" onsubmit="return false" method="post">';
	        html += '<input type="hidden" value="10" id="u_idx" name="u_idx">';         //관리자만 작성가능
	        html += '<input type="hidden" id="q_num" name="q_num" value="'+q_num+'">';
	        html += '<table class="table" id=replywriteTable>';
			html += '<tr>'
			html += '<td id="title"><label for="rp_writer">작성자</label></td>';
			html += '<td style="width:80%"><input type="text" name="rp_writer" id="rp_writer" class="form-control" value="관리자" readonly/></td>'; 
			html += '</tr>';
			html +=	'<tr>';
			html += '<td id="title"><label for="rp_title">제목</label></td>'
			html += '<td><textarea class="form-control"  placeholder="제목을 입력하세요." required id="rp_title" name="rp_title"></textarea></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td id="title"><label for="rp_text">내용</label></td>'
			html += '<td><textarea class="form-control"  placeholder="내용을 입력하세요." required id="rp_text" name="rp_text"></textarea></td>'
			html += '</tr>';
			html += '<tr>';

// 			html += '<td><input type="submit" class="btn btn-primary" value="작성완료" onclick="submitForm('+q_num+')"></td>';
// 			html += '<td><button class="btn btn-secondary" onclick="cancelwrite('+q_num+')">작성 취소</button></td>';
			html += '</tr>';
			html += '</table>';
			html += '<input type="submit" class="btn btn-primary btn-block" value="작성완료" onclick="submitForm('+q_num+')">';
			html += '<button class="btn btn-secondary btn-block" onclick="cancelwrite('+q_num+')">작성 취소</button>';
			html += '</form>';
			html += '</div>';
			html += '</div>';
			

	        $('#getreplylist'+q_num).html(html);
	    } 
		
		


		//답글작성 폼 접기 버튼(확인 or 취소 alert)
		function cancelwrite(q_num){
			
			if($("#writeBox"+q_num+":visible")){
				msg = "작성을 취소하시겠습니까?";
				if(confirm(msg)!=0){
					$("#writeBox"+q_num).hide();
				}else{
					$("#writeBox"+q_num).show();
				}				
			}
		}
		

 		    //답글 작성
			 function submitForm(q_num){				 
			        
			        var formData = new FormData();
			        
			        console.log("submitForm idx: "+$('#u_idx').val());
			        
			      	formData.append("u_idx",$('#u_idx').val());
			        formData.append("rp_writer",$('#rp_writer').val());
			        formData.append("rp_title",$('#rp_title').val());
			        formData.append("rp_text",$('#rp_text').val());
			       	formData.append("q_num", $('#q_num').val());
			       	
			       
			        
			    
			        $.ajax({
			            type : 'POST',
			            //url : 'http://localhost:8080/runbike/rest/reply',
			            url : './rest/reply',
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
			        
			    	//alert('글번호 :'+q_num);
			    	
			    	$.ajax({
						//url : 'http://localhost:8080/runbike/rest/reply/reply/'+q_num,
						url : './rest/reply/reply/'+q_num,
						type : 'GET',
						success : function(data){
							if(data.length>0){
			  
			                var html = '';
								html +='<button class="btn btn-outline-secondary float-left" id="replyhidebtn" onclick="hidebox('+q_num+')">리스트 접기</button>';
			                for(var i=0; i<data.length;i++){
			                	//html += '<div class="card">\n';
			                	html +='<div class="container table-responsive">';
			                	 html += '<div id="writeBox'+q_num+'" class="row" style="display:block;">';
								html +='<table class="table" width="800" border="3" align="center">';

			                	 html += '<tr>';
			                	 html += '<td id="title" style="font-weight:bold">작성자</td>';
			                	 html += '<td>'+data[i].rp_writer+'</td>';
			                	 html += '<td id="title" style="font-weight:bold">작성일자</td>';
			                	 html += '<td colspan=3>'+data[i].rp_regdate+'</td>';
			                	 html += '</tr>';
			                	 html += '<tr>';
			                	 html += '<td id="title" style="font-weight:bold">제목</td>';
			                	 html += '<td colspan=5>'+ data[i].rp_title +'</td>';
			                	 html += '</tr>';
			                	 html += '<tr>';
			                	 html += '<td id="text" style="font-weight:bold">내용</td>';     
			                	 html += '<td colspan=5>' + data[i].rp_text +'</td>';		
			                	 html += '</tr>';
			                	 
// 			                	 html += '<tr>';
// 			                	 html += '<td id="title" style="font-weight:bold">원글번호</td>';
// 			                	 html += '<td>' + data[i].q_num +'</td>';	
// 			                	 html += '<td id="title" style="font-weight:bold">답글번호</td>';
// 			                	 html += '<td>' + data[i].rp_num +'</td>';	
								if(${loginInfo.u_id == 'admin'}){
			                	 html += '<button class="btn btn-outline-secondary float-right" onclick="delreply('+ data[i].rp_num +')">삭제하기</button>';
								}
// 			                	 html +='</tr>';
			                	 html += '</div>';
			                	 html += '<br>';
			                	 html += '</div>';
			                	
			                	// html += '</div>';
			                	
			                }
			     
			                $('#getreplylist'+q_num).html(html);
			                
							  }else{
							        alert("답글이 없습니다.");
							       }
							  }		    		
					});
				}
				
			
			
			//답글리스트 접기 버튼
			function hidebox(q_num){
				
				if($("#writeBox"+q_num+":visible")){
					$("#writeBox"+q_num).hide();
					$("#replyhidebtn").hide();
					
				}
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
			

			
			

			
			
		
	        
			
			
			
			//게시글 상세보기(내용까지 보이도록)
			function detaildata(q_num){
				
				disNone();
				
				$('#detailFrame').css('display','block');
					
					$.ajax({
						//url : 'http://localhost:8080/runbike/rest/board/detail/'+q_num,
						url : './rest/board/detail/'+q_num,
						type : 'GET',
						 success : function(data){
			                    $('#dq_num').val(data.q_num);
			                    $('#dq_writer').val(data.q_writer);
			                    $('#dq_title').val(data.q_title);
			                    $('#dq_content').val(data.q_content);
			                    $('#dregdate').val(data.regdate);
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
		                //url : 'http://localhost:8080/runbike/rest/board/del/'+q_num,
		                url : './rest/board/del/'+q_num,
		                type : 'DELETE',
		                success : function(data){
		                        if(data=='SUCCESS'){
		                        alert('삭제가 완료되었습니다');
		                        
		                        //상세보기 창이 떠있을때 해당문의글 삭제시 상세보기 창을 안보이게
		                        $('#detailFrame').css('display','none');
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
			
			var q_num =$('#q_num').val();      
			
			if(confirm('정말 삭제하시겠습니까?')){
		           $.ajax({
		                //url : 'http://localhost:8080/runbike/rest/reply/del/'+rp_num,
		                url : './rest/reply/del/'+rp_num,
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