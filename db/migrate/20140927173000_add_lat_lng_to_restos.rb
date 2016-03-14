class AddLatLngToRestos < ActiveRecord::Migration
  def change
    add_column :restos, :lat ,:decimal,:precision => 15, :scale => 10
    add_column :restos, :lng ,:decimal,:precision => 15, :scale => 10
  end
end
