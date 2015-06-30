---
---

$(document).ready ->
  $('.js-sortable-table').tablesorter
    sortList: [[
     0
     0
    ]],
    headers:
      5:
        sorter: false

#  $('.js-date').each() ->
#    thisdate = new Date($(this).text())
#    $(this).text(thisdate)

  colSum()
  $('.js-sortable-table').stickyTableHeaders()

  $('.js-price-selector-all').change ->
    checkBoxes = $('.js-price-selector')
    checkBoxes.prop 'checked', !checkBoxes.prop('checked')


colSum = ->
  sum = 0
  $('.js-price').each ->
    val = $(this).text()
    if !isNaN(val) and val.length != 0
      sum += parseFloat(val)
      dollar = parseFloat(val).toFixed(2).toString()
      $(this).text( dollar ).prepend("$")

  $('.js-total-price').html(sum.toFixed(2).toString()).prepend("$")