---
---

$(document).ready ->
  $('#myTable').tablesorter()

  $('.js-date').each() ->
    thisdate = new Date($(this).text())
    $(this).text(thisdate)