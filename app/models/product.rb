class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images
  has_many :order_line_items
  has_many :orders, through: :order_line_items
  validates :category, presence: true

  def list_price_difference
    list_price - price
  end

  def percentage_saved
    ((list_price_difference.to_f/list_price.to_f) * 100).to_i
  end

  def primary_image
    product_images.first
  end

  def primary_image_url(size=nil)
    primary_image.image_url(size)
  end
end
