---
---

$(document).ready ->

#  $('.js-date').each() ->
#    thisdate = new Date($(this).text())
#    $(this).text(thisdate)

  colSum()
  $('.js-sortable-table').stickyTableHeaders()

  $('.js-sortable-table').DataTable
    paging: false,
    "order": [1, 'asc'],
    'columnDefs': [{
      'orderable': false
      'targets': 6
    }]

  $('.js-price-selector-all').change ->
    $(this).attr('checked', false)
    $('.js-price-selector').attr('checked', false)
    $('.js-summed-price-display').text("Price")

  $('.js-price-selector').change ->
    selectedSum()

  $('.js-system-select').click (e) ->
    system = $(this).data("system")
    checkBoxes = $('[data-system=' + system + ']').parent().siblings('.js-price-selector-parent').find('.js-price-selector')
    checkBoxes.prop("checked",!checkBoxes.prop("checked"))
    selectedSum()
    e.preventDefault()

selectedSum = ->
  selected_sum = 0
  $('.js-price-selector:checked').each ->
    selected_val = $(this).parent().parent().siblings('.js-price').text().replace("$", "")
    selected_sum += parseFloat(selected_val)
    selected_dollar = parseFloat(selected_val).toFixed(2).toString()
    $(this).text(selected_dollar).prepend("$")

  $('.js-summed-price-display').html(selected_sum.toFixed(2).toString()).prepend("$")

colSum = ->
  sum = 0
  $('.js-price').each ->
    val = $(this).text()
    if !isNaN(val) and val.length != 0
      sum += parseFloat(val)
      dollar = parseFloat(val).toFixed(2).toString()
      $(this).text( dollar ).prepend("$")

  $('.js-total-price').html(sum.toFixed(2).toString()).prepend("$")