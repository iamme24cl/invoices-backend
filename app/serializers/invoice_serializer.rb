class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :payment_due, :description, :payment_terms, :status, :client_name, :client_email, :client_address, :total, :items, :account
end