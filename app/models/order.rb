class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.pendingOrders
    all.where(delivered_at: nil).order(id: :asc)
  end

  def self.deliveredOrders
    all.where(status: !nil).order(id: :asc)
  end
end
