class AddDiscountToPromoAgain < ActiveRecord::Migration
  def change
    add_column :promos, :discount ,:integer
  end
end
