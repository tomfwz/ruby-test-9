class ProductsController < ApplicationController
  def index
    @product_filter = ProductFilter.new(product_filter_params)
    @products = Product.all
  end

  private

  def product_filter_params
    return nil if params[:product_filter].nil?
    params.require(:product_filter).permit(:min_price, :max_price, brand_ids: [])
  end
end