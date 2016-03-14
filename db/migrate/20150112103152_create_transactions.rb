class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :message
      t.text :pay_method
      t.integer :pricing_plan_id
      t.integer :admin_id

      t.timestamps null: false
    end

    create_table :informations do |t|
      t.text :name
      t.integer :rut
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
