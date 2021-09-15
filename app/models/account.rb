class Account < ApplicationRecord
  has_many :api_keys, as: :bearer 

  has_many :invoices
  validates :accountname, :email, :address, presence: true
  has_secure_password
end
