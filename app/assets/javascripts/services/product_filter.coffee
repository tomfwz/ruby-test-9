@product_filter = ->
  auto_submit_filter_form = () ->
    brands_list     = $('.new_product_filter').find('input[type=checkbox]')

    form = $('form.new_product_filter')

    brands_list.each ->
      $(this).click ->
        form.submit()

  auto_submit_filter_form()