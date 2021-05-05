class Account < ApplicationRecord
  has_many :invoices
  validates :accountname, :address, presence: true
end
