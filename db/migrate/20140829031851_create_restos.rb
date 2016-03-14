class CreateRestos < ActiveRecord::Migration
  def change
    create_table :restos do |t|
      t.string :name
      t.integer :resto_tipo_id
      t.timestamps
    end
  end
end
