class RemoveDescuentofromPromos < ActiveRecord::Migration
  def change
    remove_column :promos, :discount
  end
end
