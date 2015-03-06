class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  def self.most_recent
    # Find the first ten orders sorted by date created

    all.sort_by { |order| order.created_at }.last(10).reverse
  end

  def self.largest
    # Find the 3 largest orders based on
    # number of items on the order

    all.sort_by do |order|
      order.items.count
    end.last(3).reverse
  end
end
