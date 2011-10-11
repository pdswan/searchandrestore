$(function() {
  function findNextInput(start) {
    return $(start).parents('li').next('li').find('input')[0];
  }

  // when a value is selected from chosen, null the value in the
  // corresponding new field
  $(".chzn-select-with-new").chosen().change(function() {
    // if something is actually selected clear out the new input
    if (this.selectedIndex != 0) {
      findNextInput(this).value = null;
    }
  });
  $(".chzn-select-with-new").each(function() {
    var chosen = $(this).data('chosen');

    $(this).next(".chzn-container-single").find(".chzn-drop .chzn-search").keyup(function(evt) {
      var stroke = (_ref = evt.which) != null ? _ref : evt.keyCode;
      if (stroke == 13) {
        if (chosen.search_field.attr('value')) {
          evt.preventDefault();
          var new_input = findNextInput(this);

          // set the value of the new input to the value of the search
          new_input.value = chosen.search_field.attr('value');

          // deselect all existing values from select box
          // pass in empty object instead of evt because
          // results_reset tries to remove evt.target which breaks things
          // after the new functionality has been used
          chosen.results_reset({ });
          chosen.close_field();
          new_input.focus();
        }
      }
    });
  });

  $(".chzn-select").chosen();
});

