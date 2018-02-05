class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  has_one :cart
  has_many :shipping_addresses
  has_many :payment_methods

  after_create :generate_cart

  private

  def generate_cart
    Cart.find_or_create_by user: self
  end
end
