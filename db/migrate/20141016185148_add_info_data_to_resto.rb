class AddInfoDataToResto < ActiveRecord::Migration
  def change
    add_column :restos, :telefono ,:string
    add_column :restos, :open ,:integer
    add_column :restos, :close ,:integer
    add_column :restos, :direccion ,:string
  end
end
