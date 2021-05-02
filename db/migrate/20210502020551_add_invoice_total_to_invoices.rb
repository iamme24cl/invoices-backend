class AddInvoiceTotalToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :invoice_total, :float, :default => 0.0
  end
end
