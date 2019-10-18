$(document).ready(function() {
          
          $('#toggle-menu').click(function(){
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
          });
          
          var path = window.location.pathname;
          
          switch(path){
          
          	case '/runbike/record/ridingGuide':
          	case '/runbike/record/myCourseList':
          	case '/runbike/record/startRide':
          		 $('nav a.pt-md-2[href$="/runbike/record/startRide"]').addClass("active");
          		 return;
          	case '/runbike/party':
          	case '/runbike/party/**':
          		$('nav a.pt-md-2[href$="/runbike/party"]').addClass("active");
          		return;
          	case '/runbike/stamp/getStamp':
          		$('nav a.pt-md-2[href$="/runbike/stamp/getStamp"]').addClass("active");
          		return;
          	case '/runbike/badge/user':
          	case '/runbike/stamp/user':
          		$('nav a.pt-md-2[href$="/runbike/badge/user"]').addClass("active");
          		return;
          	case '/runbike/qnaboard':
          		$('nav a.pt-md-2[href$="/runbike/qnaboard"]').addClass("active");		
          		return;
          }
          
          
         
    });