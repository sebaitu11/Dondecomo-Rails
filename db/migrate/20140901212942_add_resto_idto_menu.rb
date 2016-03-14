class AddRestoIdtoMenu < ActiveRecord::Migration
  def change
    add_column :menus, :resto_id ,:integer

  end
end
