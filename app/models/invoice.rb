class Invoice < ApplicationRecord
  has_many :items
  belongs_to :account

  accepts_nested_attributes_for :items

  def update_total
    # item_totals = []
    # self.items.each do |item|
    #   item_totals << item.total
    # end
    # self.invoice_total = item_totals.reduce(0) { |sum, total| sum + total }
    self.invoice_total = Invoice.joins(:items).where("items.invoice_id =?", self.id).sum(:total)
  end
end
