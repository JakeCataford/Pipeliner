//=require jqueryform
//=require unity
function success(response) {
  if(response != "") {
    location.reload(false)
  } else {
    alert("failed to add comment")
  }
}

$(document).ready(function() {
          var options = {
              clearForm:true,
              success: success
          };

          $('#comment-form').ajaxForm(options);

          $('.canvas-zone').width(window.innerWidth - $('.sidebar').width());
          $('.canvas-zone').height(window.innerHeight - 60);

          $(window).resize(function() {
            $('.canvas-zone').width(window.innerWidth - $('.sidebar').width());
            $('.canvas-zone').height(window.innerHeight - 60);
          });
});