(function() {
  var colSum, selectedSum;

  $(document).ready(function() {
    colSum();
    $('.js-sortable-table').stickyTableHeaders();
    $('.js-sortable-table').DataTable({
      paging: false,
      "order": [1, 'asc'],
      'columnDefs': [
        {
          'orderable': false,
          'targets': 6
        }
      ]
    });
    $('.js-price-selector-all').change(function() {
      $(this).attr('checked', false);
      $('.js-price-selector').attr('checked', false);
      return $('.js-summed-price-display').text("Price");
    });
    $('.js-price-selector').change(function() {
      return selectedSum();
    });
    return $('.js-system-select').click(function(e) {
      var checkBoxes, system;
      system = $(this).data("system");
      checkBoxes = $('[data-system=' + system + ']').parent().siblings('.js-price-selector-parent').find('.js-price-selector');
      checkBoxes.prop("checked", !checkBoxes.prop("checked"));
      selectedSum();
      return e.preventDefault();
    });
  });

  selectedSum = function() {
    var selected_sum;
    selected_sum = 0;
    $('.js-price-selector:checked').each(function() {
      var selected_dollar, selected_val;
      selected_val = $(this).parent().parent().siblings('.js-price').text().replace("$", "");
      selected_sum += parseFloat(selected_val);
      selected_dollar = parseFloat(selected_val).toFixed(2).toString();
      return $(this).text(selected_dollar).prepend("$");
    });
    return $('.js-summed-price-display').html(selected_sum.toFixed(2).toString()).prepend("$");
  };

  colSum = function() {
    var sum;
    sum = 0;
    $('.js-price').each(function() {
      var dollar, val;
      val = $(this).text();
      if (!isNaN(val) && val.length !== 0) {
        sum += parseFloat(val);
        dollar = parseFloat(val).toFixed(2).toString();
        return $(this).text(dollar).prepend("$");
      }
    });
    return $('.js-total-price').html(sum.toFixed(2).toString()).prepend("$");
  };

}).call(this);
