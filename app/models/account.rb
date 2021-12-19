class Account < ApplicationRecord
  has_many :api_keys, as: :bearer, dependent: :delete_all

  has_many :invoices
  validates :accountname, :email, :address, presence: true
  has_secure_password
end
