class AddRandomCodeToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :random_code, :string
  end
end
