class Account < ApplicationRecord
  validates :accountname, :email, :address, presence: true
  has_secure_password
  has_many :api_keys, as: :bearer, dependent: :delete_all
  has_many :invoices
end
