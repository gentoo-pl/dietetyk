class CreateDania < ActiveRecord::Migration[5.1]
  def change
    create_table :dania do |t|
      t.string :nazwa, null: false
      t.integer :suma_wartosci_energetycznej, default: 0
      t.integer :dodatkowa_wartosc_energetyczna, default: 0
      t.string :obrazek, default: ""
      t.boolean :aktywne, default: true
      t.text :opis
      t.boolean :polecane, default: false

      t.timestamps
    end
  end
end
