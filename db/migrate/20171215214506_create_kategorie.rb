class CreateKategorie < ActiveRecord::Migration[5.1]
  def change
    create_table :kategorie do |t|
      t.string :nazwa, null: false
      t.boolean :aktywna, default: true

      t.timestamps
    end
  end
end
