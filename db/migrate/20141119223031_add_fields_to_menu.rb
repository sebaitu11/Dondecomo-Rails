class AddFieldsToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :entrada ,:text
    add_column :menus, :fondo ,:text
    add_column :menus, :postre ,:text
    add_column :menus, :bebestible ,:text
    remove_column :restos, :tags
  end
end
