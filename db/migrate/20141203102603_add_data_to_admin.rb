class AddDataToAdmin < ActiveRecord::Migration
  def change
    add_column :owners, :resto_name ,:text
    add_column :owners, :name ,:text
  end
end
