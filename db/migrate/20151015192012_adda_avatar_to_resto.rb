class AddaAvatarToResto < ActiveRecord::Migration
  def change
    add_column :restos, :avatar, :string
  end
end
