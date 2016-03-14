class AddAvatarToMenu < ActiveRecord::Migration
  def self.up
    add_attachment :menus, :avatar
  end

  def self.down
    remove_attachment :menus, :avatar
  end
end
