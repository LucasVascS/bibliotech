Paloma.controller('Books', {
  index: function(){
    show_table()
    search_book()
    reload_button()
    
}
});
function search_book(){
  $('.searchbook').on("click", function () {
    var formdata = $("form.searchformclass").serialize()
    $.ajax({url:'/books/show_table', data: formdata, success: function(result) {
      $("#ajaxtable").html(result);
      openModal()


    }});

  });
}
function show_table(){
  $.ajax({url:'/books/show_table', success: function(result) {
    $("#ajaxtable").html(result);
    openModal()
  }});
  
}
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

function reload_button(){
  $('.reloadbutton').on("click", function() {
    show_table()
    $('form.searchformclass').each (function() {
      this.reset();
    });

  });
}


