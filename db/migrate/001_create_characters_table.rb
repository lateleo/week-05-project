class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.integer :level
      t.integer :race_id
      t.integer :racial_ability_id
      t.integer :class_id
      t.integer :stamina
      t.integer :strength
      t.integer :agility
      t.integer :spell_power
      t.integer :wit
      t.text :backstory
    end
  end
end
