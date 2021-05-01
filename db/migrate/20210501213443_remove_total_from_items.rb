class RemoveTotalFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :total, :float
  end
end
