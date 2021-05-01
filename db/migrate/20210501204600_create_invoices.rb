class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.datetime :payment_due
      t.string :description
      t.integer :payment_terms
      t.string :status, :default => "draft"
      t.string :client_name
      t.string :client_email
      t.string :client_address
      t.float :total
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
