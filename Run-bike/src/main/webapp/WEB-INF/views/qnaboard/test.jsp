<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	div {
		border : 2px solid #666;
		width : 200px;
	}
	
	a {
		display : block;
		cursor:pointer;
	}
	
	#paging {
		overflow: hidden;
		margin-top: 10px;
	}
	
	#paging>span {
		width : 20px;
		height : 20px;
		display : block;
		float : left;
		margin : 0 2px;		
		border : 1px solid #333;
		text-align: center;
		line-height: 20px;
		font-size: 12px;
		border-radius: 50%;
	}
</style>
</head>
<body>
	
	<H1> 게시글 리스트 테스트  </H1>
	
	
	<article id="list">
	
	</article>
	<article id="paging">
	
	</article>
	
		
	
	



<script>

	$(document).ready(function(){
		
		
		page(1);
		
	});
	
	function page(num){
		
		//alert(num);
		
		$.ajax({
			url : 'http://localhost:8080/runbike/qnaboard/testlist',
			type : 'get',
			data : {page:num},
			success : function(data){
				//alert(data);
				//console.log(data);
				//alert(data.messageTotalCount);
				//alert(JSON.stringify(data));
				
				var output = '';
				
				var list = data.messageList;
				for(var i = 0; i < list.length; i++){
					console.log(list[i]);
					var qnum = list[i].q_num;
					var title = list[i].q_title;
					var writer = list[i].q_writer;
					var content = list[i].q_content;
					
					output += '<div>\n';
					output += '글번호 : '+qnum+' <br>\n';
					output += '제목: '+title+' <br>\n';
					output += '작성자 : '+writer+'<br>\n';
					output += '내용 :'+content+'\n'
					output += '</div>\n';
				}
				
				
				var paging = '';
				
				for(var j=1 ; j<data.pageTotalCount+1 ; j++){
					paging += '<span class="paging"><a onclick="page('+j+')" >'+j+'</a></span> ';
				}
				
				
				//alert(output);
				
				$('#list').html(output);
				$('#paging').html(paging);
				
				
			}
		});
	}
	

</script>







</body>
</html>