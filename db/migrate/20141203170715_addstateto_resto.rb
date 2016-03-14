class AddstatetoResto < ActiveRecord::Migration
  def change
    add_column :restos, :online ,:boolean
  end
end
