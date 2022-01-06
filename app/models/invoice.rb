class Invoice < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :account
  validates :payment_due, :description, :payment_terms, :status, :client_name, :client_email, :client_address, presence: true
  validates :payment_terms, acceptance: { accept: [1, 15, 30], message:  "Payment terms must be Net 15 or 30" }
  validates :status, acceptance: { accept: ['draft', 'pending', 'paid'], message: "Must be draft, pending or paid" }
  accepts_nested_attributes_for :items
  after_initialize :update_total

  def update_total
    self.invoice_total = Invoice.joins(:items).where("items.invoice_id =?", self.id).sum(:total)
  end

  def generate_code(num)
    charset = Array('A'..'Z')
    Array.new(num) { charset.sample }.join
  end

  def set_random_code
    self.random_code = generate_code(5) + self.id.to_s
  end
end
