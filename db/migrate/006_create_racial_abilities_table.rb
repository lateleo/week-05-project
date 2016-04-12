class CreateRacialAbilitiesTable < ActiveRecord::Migration
  def change
    create_table :racial_abilities do |t|
      t.string :name
      t.integer :race_id
      t.text :description
    end
  end
end
