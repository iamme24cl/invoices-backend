class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountname, :address
  has_many :invoices
end
