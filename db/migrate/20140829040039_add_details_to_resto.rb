class AddDetailsToResto < ActiveRecord::Migration
  def change
    add_column :restos, :details, :string
    add_column :restos, :image, :string

  end
end
