/* global $ */
/* global hide */
/* global time */
/* global Dropzone */


 // $(document).ready(function(){
 //  $(function() {
 //    Dropzone.autoDiscover = false;
 //    var menuDropzone = new Dropzone("#menu-dropzone");
 //    menuDropzone.options.addRemoveLinks = true;
 //    return menuDropzone.on("success", function(file, responseText) {
 //      var imageUrl;
 //      imageUrl = responseText.file_name.url;
 //    });
 //  });
  
  
 // });

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
 

 

});