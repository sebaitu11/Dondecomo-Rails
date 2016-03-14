class AddUserIdToResto < ActiveRecord::Migration
  def change
    add_column :restos, :owner_id ,:integer
  end
end
