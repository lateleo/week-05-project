class CreateRacesTable < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :age_of_adulthood
      t.integer :stamina_index
      t.integer :strength_index
      t.integer :agility_index
      t.integer :spell_power_index
      t.integer :wit_index
      t.text :flavor_text
    end
  end
end
