# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  shipping_method_id  :integer
#  payment_method_id   :integer
#  shipping_address_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :order do

  end

end
