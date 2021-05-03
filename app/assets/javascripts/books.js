Paloma.controller('Books', {
  index: function(){
    show_table()
    search_book()
    reload_button()
    autentication()  
  }
});
function search_book(){
  $('.searchbook').on("click", function () {
    var formdata = $("form.searchformclass").serialize()
    $.ajax({url:'/books/show_table', data: formdata, success: function(result) {
      $("#ajaxtable").html(result);
      openModal()
      delete_book()
    }});

  });
}

function show_table(){
  $.ajax({url:'/books/show_table', success: function(result) {
    $("#ajaxtable").html(result);
    openModal()
    delete_book()
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
function delete_book(){
  $('.destroybook').on("click", function() {
    var bookid = $(this).attr('data-url');
    Swal.fire({
      title: 'Tem certeza ?',
      text: "Esta ação é irreversível",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sim, Excluir!',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          'Excluido!',
          'Este registro foi deletado.',
          'success',
          $.ajax({method: 'delete',data: { authenticity_token: autentication() }, url: bookid, success: function() {
            show_table()
      
          }})
        )
      }
    })
  });
}

function autentication(){
  return $('[name="csrf-token"]')[0].content

}