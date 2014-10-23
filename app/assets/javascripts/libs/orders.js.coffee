class AjaxForm

  # example
  # form: 'new_order'
  # fields_prefix: 'order' for inputs 'order[username]'
  # modal_background: '#popup_back' dark div background
  # modal_div: '#order_popup' form wrapper with text and close button
  # popup_button: 'button.order_button' button to show popup can be $ list
  constructor: (options) ->
    {@form, @fields_prefix, @modal_background, @modal_div, @popup_button} = options

    @modal_background.click @hide_modal                 if @modal_background?
    @modal_div.find('> .close').click @hide_modal if @modal_div?
    @popup_button.click @show_modal               if @popup_button?

    @form.on('ajax:success', @on_success)
         .on('ajax:error', @on_error)
         .on('ajax:beforeSend', @before_send)
    return

  hide_modal: =>
    @modal_background.hide()
    @modal_div.hide()
    return

  show_modal: =>
    @modal_background.show()
    @modal_div.show()
    return

  clear_errors: ->
    @modal_div.find('.field_error').removeClass('field_error')
    @modal_div.find('.errors').empty()
    return

  before_send: =>
    @form.find('[type="submit"]').prop('disabled', true)
    @clear_errors()
    return

  on_success: (e, data, status, xhr) =>
    @modal_div.find('.result_block').text('Ваша заявка успешно отправлена')
    @clear_errors()
    @form.find('[type="submit"]').prop('disabled', false)
    return

  on_error: (e, xhr, status, error) =>
    @form.find('[type="submit"]').prop('disabled', false)
    if !xhr.responseJSON or !xhr.responseJSON.errors
      @modal_div.find('.result_block').text('Что-то пошло не так')
      return
    @modal_div.find('.result_block').empty()
    # display errors
    for name, field of xhr.responseJSON.errors
      inp_div = @modal_div.find('div.' + @fields_prefix + '_' + name)
      error_block = inp_div.find('div.errors')
      # create err div for input if not exist
      error_block = $('<div></div>').addClass('errors') if !error_block.length
      error_block.empty()
      inp_div.append(error_block).addClass('field_error')
      for err in field
        error_block.append $('<p></p>').text(err)
    return



init_popup = ->
  f1 = new AjaxForm
    fields_prefix: 'order'
    modal_background: $('#background')
    modal_div: $('#order_block')
    form: $('#order_block form')
    popup_button: $('button.order_button')

  f2 = new AjaxForm
    form: $('#new_order_block_2 form')
    fields_prefix: 'order'
    modal_background: null
    modal_div: $('#new_order_block_2')
    popup_button: null
  return

$(document).ready init_popup
$(document).on 'page:load', init_popup