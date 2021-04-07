Paloma.controller('Books', {
  index: function(){
    openModal()
}
});

function openModal(){
  $('.open-modal').on("click", function() {
    $('#exampleModal').modal('show')
    var url = $(this).attr('data-url');
    var bookName = $(this).attr('data-name');  
    $.ajax({url: url, success: function(result){
      $("#exampleModal .modal-body").html(result);
      $("#exampleModal .modal-title").html(bookName);
    }});
    

  });
}