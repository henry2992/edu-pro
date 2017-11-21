# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  checked_items = 0
  $('.list_item_checkbox').change ->
    if $(this).is(':checked')
      checked_items += 1
    else
      checked_items -= 1
    $('#selected_items').text checked_items
    return
  return