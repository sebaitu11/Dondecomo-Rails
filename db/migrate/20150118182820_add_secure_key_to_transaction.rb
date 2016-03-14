class AddSecureKeyToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :key, :string
    add_column :transactions, :state, :string
  end
end
