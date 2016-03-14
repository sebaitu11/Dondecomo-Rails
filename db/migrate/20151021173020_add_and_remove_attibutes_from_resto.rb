class AddAndRemoveAttibutesFromResto < ActiveRecord::Migration
  def change
    remove_column :restos, :hasFumadores
    remove_column :restos, :hasMenu
    add_column    :restos, :hasDelivery, :boolean
  end
end
