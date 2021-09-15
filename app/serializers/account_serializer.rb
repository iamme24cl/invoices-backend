class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountname, :address
  has_many :invoices
  has_many :api_keys, as: :bearer
end
