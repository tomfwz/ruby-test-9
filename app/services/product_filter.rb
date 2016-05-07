class ProductFilter
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :brand_ids, :min_price, :max_price, :sort_by

  def initialize(options)
    return if options.nil?
    @brand_ids = options[:brand_ids]
    @min_price = options[:min_price].to_f
    @max_price = options[:max_price].to_f
    @sort_by   = options[:sort_by]
  end

  def result
    result = Product.all
    result = result.find_by_brand_ids(@brand_ids)   if @brand_ids.present?
    result = result.where('price >= ?', @min_price) if @min_price.present?
    result = result.where('price <= ?', @max_price) if @max_price.present?
    result = result.order('name ASC')               if @sort_by == 'Alphabetical'
    result = result.order('price ASC')              if @sort_by == 'ASC Price'
    result = result.order('price DESC')             if @sort_by == 'DESC Price'
    result
  end

  def persisted?
    false
  end
end