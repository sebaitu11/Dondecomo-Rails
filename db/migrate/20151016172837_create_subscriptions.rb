class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.boolean  :active
      t.date     :expiration_date
      t.string   :mode
      t.integer  :resto_id
      t.integer  :amount
      t.timestamps null: false
    end
  end
end
