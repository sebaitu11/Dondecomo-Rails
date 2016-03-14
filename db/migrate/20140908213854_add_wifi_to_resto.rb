class AddWifiToResto < ActiveRecord::Migration
  def change
    add_column :restos, :hasWifi ,:boolean
  end
end
