class CreateJoinTableDanieSkladnik < ActiveRecord::Migration[5.1]
  def change
    create_join_table :dania, :skladniki do |t|
      t.index [:danie_id, :skladnik_id]
      # t.index [:skladnik_id, :danie_id]
    end
  end
end
