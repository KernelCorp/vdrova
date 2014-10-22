init_popup = ->
  entity_name = 'order'
  modal_back = $('#background')
  modal_div = $('#order_block')
  form = $('#new_order')

  hide_modal = ->
    modal_back.hide()
    modal_div.hide()
    return
  show_modal = ->
    modal_back.show()
    modal_div.show()
    return
  clear_errors = ->
    modal_div.find('.field_error').removeClass('field_error')
    modal_div.find('.errors').empty()
    return
  before_send = ->
    form.find('[type="submit"]').prop('disabled', true)
    clear_errors()
    return
  on_success = (e, data, status, xhr)->
    modal_div.find('.result_block').text('Ваша заявка успешно отправлена')
    clear_errors()
    form.find('[type="submit"]').prop('disabled', false)
#    form[0].reset()
    return
  on_error = (e, xhr, status, error)->
    form.find('[type="submit"]').prop('disabled', false)
    if !xhr.responseJSON or !xhr.responseJSON.errors
      modal_div.find('.result_block').text('Что-то пошло не так')
      return
    modal_div.find('.result_block').empty()
    for name, field of xhr.responseJSON.errors
      inp_div = modal_div.find('div.' + entity_name + '_' + name)
      error_block = inp_div.find('div.errors')
      error_block = $('<div></div>').addClass('errors') if !error_block.length
      error_block.empty()
      inp_div.append(error_block).addClass('field_error')
      for err in field
        error_block.append $('<p></p>').text(err)
    return
  modal_back.click hide_modal
  modal_div.find('> .close').click hide_modal
  $('button.order_button').click show_modal
  form.on('ajax:success', on_success).on('ajax:error', on_error).on('ajax:beforeSend', before_send)
  return

$(document).ready init_popup
$(document).on 'page:load', init_popup