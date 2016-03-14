class RemoveDescriptionFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :description
  end
end
