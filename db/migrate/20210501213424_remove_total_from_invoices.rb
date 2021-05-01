class RemoveTotalFromInvoices < ActiveRecord::Migration[6.1]
  def change
    remove_column :invoices, :total, :float
  end
end
