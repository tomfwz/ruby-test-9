@product_filter = ->
  auto_submit_filter_form = () ->
    brands_list     = $('.new_product_filter').find('input[type=checkbox]')
    min_price       = $('#product_filter_min_price')
    max_price       = $('#product_filter_max_price')
    sort_by         = $('#product_filter_sort_by')

    form = $('form.new_product_filter')

    brands_list.each ->
      $(this).click ->
        form.submit()

    min_price.change ->
      form.submit()

    max_price.change ->
      form.submit()

    sort_by.change ->
      form.submit()

  auto_submit_filter_form()