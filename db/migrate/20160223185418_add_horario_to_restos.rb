class AddHorarioToRestos < ActiveRecord::Migration
  def change
    remove_column :restos, :close
    remove_column :restos, :open
    add_column    :restos, :horario, :text
  end
end
