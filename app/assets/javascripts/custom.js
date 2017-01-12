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
    maxFilesize: 3,
    // addRemoveLinks: true,
    acceptedFiles: ".jpeg,.jpg,.png,.gif", 
    sucess:function(file, response) {
       var imageUrl;
       imageUrl = response.file_name.url;
    //   $(file.previewTemplate).find('.dz-remove').attr('id', response.id);
    //   $(file.previewTemplate).find('.dz-remove').attr('menu_id', response.menu_id);
    // },
     // removedfile: function(file){
     //  var id = $(file.previewTemplate).find('.dz-remove').attr('id');
     //  var boat_id = $(file.previewTemplate).find('.dz-remove').attr('menu_id');
     //  $.ajax({
     //   type: 'DELETE',
     //   url: '/menus/' + id,
     //   success: function(file){
     //     $(file.previewTemplate).fadeOut()
     //   }
     //  });
      }
  });

  
  
});