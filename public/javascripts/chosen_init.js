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
      switch (stroke) {
        case 8:
        case 27:
        case 9:
        case 38:
        case 40:
        case 16:
        case 91:
        case 17:
          break;
        case 13:
          if (chosen.choices == 0) {
            var new_input = findNextInput(this);

            // set the value of the new input to the value of the search
            new_input.value = chosen.search_field.attr('value');

            // deselect all existing values from select box
            chosen.results_reset(evt);
            chosen.close_field();
            new_input.focus();
          }
          break;
      }
    });
  });

  $(".chzn-select").chosen();
});

