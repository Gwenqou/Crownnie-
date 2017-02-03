/* global $ */
/* global hide */
/* global time */
/* global Dropzone */



$(document).ready(function(){
  
  Dropzone.autoDiscover = false;
  $('#menu-dropzone').dropzone({
    maxFilesize: 2,
    acceptedFiles: ".jpeg,.jpg,.png,.gif", 
    sucess:function(file, response) {
       var imageUrl;
       imageUrl = response.file_name.url;
      }
  });
  
 $(function () {
  $('[data-toggle="tooltip"]').tooltip()
 });
 
 
 $("#images").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: "#images",
    loading: {
      msgText: "<em>Loading more...</em>",
    }
    
  });
 $(window).scroll()

// $(window).scroll(function(){
//   if ($(window).scrollTop() > $(document).height() - $(window).height() - 500){
//     $(".poping").click()
//   }
// })

});