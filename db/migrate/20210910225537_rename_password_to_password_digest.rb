class RenamePasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    rename_column :accounts, :password, :password_digest
  end
end
