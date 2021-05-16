class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :random_code, :payment_due, :description, :payment_terms, :status, :client_name, :client_email, :client_address, :invoice_total, :items, :account
  
end
