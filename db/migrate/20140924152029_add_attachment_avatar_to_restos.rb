class AddAttachmentAvatarToRestos < ActiveRecord::Migration
  def self.up
    change_table :restos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :restos, :avatar
  end
end
