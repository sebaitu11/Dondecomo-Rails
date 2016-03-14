class AddDatatToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :description ,:string
    add_column :promos, :price ,:integer
    add_column :promos, :discount ,:decimal

  end
end
