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
          
    });