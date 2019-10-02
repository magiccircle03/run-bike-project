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
          console.log("하이루루루루루");
          console.log($('nav a.pt-md-2[href$="'+ window.location.pathname+'"]'));
          
          $('nav a.pt-md-2[href$="'+ window.location.pathname+'"]').addClass("active");
          
          
    });