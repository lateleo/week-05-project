class CreateAbilitiesTable < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :damage_type
      t.integer :base_damage
      t.string :interval
      t.integer :range
      t.string :effect_shape
      t.integer :effect_size
      t.text :description
    end
  end
end
