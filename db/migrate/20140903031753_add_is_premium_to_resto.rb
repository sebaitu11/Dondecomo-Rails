class AddIsPremiumToResto < ActiveRecord::Migration
  def change
    add_column :restos, :is_premium ,:boolean

  end
end
