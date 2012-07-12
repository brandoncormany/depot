class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]
  attr_accessible :address, :email, :name, :pay_type, :ship_date
  validates :address, :email, :name, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  has_many :line_items, dependent: :destroy
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
end
