---
---

$(document).ready ->
  $('.js-sortable-table').tablesorter sortList: [[
                                                   0
                                                   0
                                                 ]]

#  $('.js-date').each() ->
#    thisdate = new Date($(this).text())
#    $(this).text(thisdate)

  colSum()
  $('.js-sortable-table').stickyTableHeaders()


colSum = ->
  sum = 0
  $('.js-price').each ->
    if !isNaN($(this).text()) and $(this).text().length != 0
      sum += parseFloat($(this).text())
  $('.js-total-price').html sum