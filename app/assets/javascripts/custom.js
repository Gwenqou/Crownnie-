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
 

 
 $(function() {
   $('#image_users').on('cocoon:after-insert', function() {
     check_to_hide_or_show_add_link();
   });

   $('#image_users').on('cocoon:after-remove', function() {
     check_to_hide_or_show_add_link();
   });

   check_to_hide_or_show_add_link();

   function check_to_hide_or_show_add_link() {
     if ($('#image_users .nested-fields').length >= 5) {
       $('#image_users .links a').hide();
     } else {
       $('#image_users .links a').show();
     }
   }
  });
 
});