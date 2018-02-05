class PaymentMethod < ApplicationRecord
  def masked_card_number
    number = self.card_number.match /(?<last_four>\d{4}$)/
    "**** **** #{number[:last_four]}"
  end
end
