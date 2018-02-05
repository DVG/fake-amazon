class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def total_items
    line_items.sum(:quantity)
  end

  def subtotal
    line_items.inject(0) { |memo, line_item| memo += line_item.subtotal }
  end
end
