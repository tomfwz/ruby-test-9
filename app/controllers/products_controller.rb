class ProductsController < ApplicationController
  def index
    @product_filter = ProductFilter.new(product_filter_params)
    @products = @product_filter.result.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def product_filter_params
    return nil if params[:product_filter].nil?
    params.require(:product_filter).permit(:min_price, :max_price, brand_ids: [])
  end
end