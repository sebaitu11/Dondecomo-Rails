class CreateRestoTipos < ActiveRecord::Migration
  def change
    create_table :resto_tipos do |t|
      t.text :name
      t.timestamps null: false
    end
  end
end
