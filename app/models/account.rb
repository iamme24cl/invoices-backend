class Account < ApplicationRecord
  has_many :invoices
end
