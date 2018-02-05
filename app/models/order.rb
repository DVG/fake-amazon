class Order < ApplicationRecord
  has_many :line_items
  has_many :products, through: :line_items

  belongs_to :shipping_method
  belongs_to :user, required: false
  belongs_to :payment_method, required: false
  belongs_to :shipping_address, required: false
end
