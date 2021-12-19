class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountname, :email, :address
  has_many :api_keys, as: :bearer
end
