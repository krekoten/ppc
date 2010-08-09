document.observe("dom:loaded", function() {
  $$('.add_file')[0].observe('click', function(event) {
    var cloned_elem = $('file_clone').clone(true);
    $('file_container').insert({bottom: cloned_elem});
    cloned_elem.show();
    cloned_elem.down('a').observe('click', function(event) {
      var element = event.element();
      element.up('div').remove();
    });
  });
});