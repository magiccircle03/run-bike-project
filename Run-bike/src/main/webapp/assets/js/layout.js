$(document).ready(function() {
          
          $('#toggle-menu').click(function(){
        	  console.log($(this));
              $(this).toggleClass('active');
              if($(this).hasClass('active')){
                  $('#navbar').addClass('opened');
                  document.documentElement.style.overflow = 'hidden';
                      document.body.scroll = "no";
              } else {
                  document.documentElement.style.overflow = 'scroll';
                  $('#navbar').removeClass('opened');
                  console.log("NO!");
                  document.body.scroll = "yes";
                  
              }
              return false;
          });
          
          var pathname = window.location.pathname;
          console.log(pathname);
          
          var path = pathname.split("/");
          console.log(path[0]+"/"+path[1]+"/"+path[2]);
          
          switch(path[0]+"/"+path[1]+"/"+path[2]){
          
          	case '/runbike/record':
          		 $('nav a.pt-md-2[href$="/runbike/record/startRide"]').addClass("active");
          		$('.page-select-name').html('혼자 라이딩');
          		 return;
          	case '/runbike/party':
          		$('nav a.pt-md-2[href$="/runbike/party"]').addClass("active");
          		$('.page-select-name').html('함께 라이딩');
          		return;
          	case '/runbike/stamp':
          		$('nav a.pt-md-2[href$="/runbike/stamp/getStamp"]').addClass("active");
          		$('.page-select-name').html('스탬프');
          		return;
          	case '/runbike/badge':
          	case '/runbike/stamp':
          		$('nav a.pt-md-2[href$="/runbike/badge/user"]').addClass("active");
          		$('.page-select-name').html('나의 리워드');
          		return;
          	case '/runbike/qnaboard':
          		$('nav a.pt-md-2[href$="/runbike/qnaboard"]').addClass("active");
          		$('.page-select-name').html('문의하기');
          		return;
          	case '/runbike/board':
          		$('nav a.pt-md-2[href$="/runbike/board/boardlist"]').addClass("active");
          		$('.page-select-name').html('문의하기');
          		return;
          	case '/runbike/adminpage':	
          		$('nav a.pt-md-2[href$="/runbike/adminpage/managelist"]').addClass("active");
          		$('.page-select-name').html('회원관리');
          		return;
          	case '/runbike/user':
          		$('.page-select-name').html('마이페이지');
          }
          
          
         
    });