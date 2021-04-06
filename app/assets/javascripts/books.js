Paloma.controller('Books', {
  index: function(){
    openModal()
}
});

function openModal(){
  $('.open-modal').on("click", function() {
    $('#exampleModal').modal('show')
    var url = $(this).attr('data-url');
    $.ajax({url: url, success: function(result){
      $("#exampleModal .modal-body").html(result);
    }});

  });
}