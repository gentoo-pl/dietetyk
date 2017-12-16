class CreateSkladniki < ActiveRecord::Migration[5.1]
  def change
    create_table :skladniki do |t|
      t.string :nazwa, null: false
      t.integer :wartosc_energetyczna, default: 0
      t.text :opis
      t.string :obrazek

      t.timestamps
    end
  end
end
