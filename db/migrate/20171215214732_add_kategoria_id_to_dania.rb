class AddKategoriaIdToDania < ActiveRecord::Migration[5.1]
  def change
    add_column :dania, :kategoria_id, :integer
  end
end
