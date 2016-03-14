class AddAtributosToResto < ActiveRecord::Migration
  def change
    add_column :restos, :hasFumadores ,:boolean
    add_column :restos, :hasReservas ,:boolean
    add_column :restos, :hasParking ,:boolean
    add_column :restos, :hasMenu ,:boolean
    add_column :restos, :hasTickets ,:boolean
  end
end
