class AddAvatarToPromo < ActiveRecord::Migration
  def self.up
    add_attachment :promos, :avatar
  end

  def self.down
    remove_attachment :promos, :avatar
  end
end
