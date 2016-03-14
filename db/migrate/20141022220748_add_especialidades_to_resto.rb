class AddEspecialidadesToResto < ActiveRecord::Migration
  def change
    add_column :restos, :tags, :string, array: true, default: '{}'
  end
end
