class Product < ActiveRecord::Base
  belongs_to :brand

  validates :name,                presence: true
  validates :price,               presence: true
  validates :brand_id,            presence: true
  validates :sku,                 presence: true

  has_attached_file :picture,     styles:      { medium: '520x520#', thumb: '260x260#', small: '130x130#' },
                                  default_url: "products/pictures/:style/missing.png"

  validates_attachment :picture,  content_type: { content_type: /\Aimage\/.*\Z/ },
                                  size:         { less_than: 5.megabyte }
end