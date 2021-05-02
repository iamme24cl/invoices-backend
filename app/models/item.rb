class Item < ApplicationRecord
  belongs_to :invoice
  after_initialize :update_total

  def update_total
    self.total = self.price * self.quantity
  end
end
