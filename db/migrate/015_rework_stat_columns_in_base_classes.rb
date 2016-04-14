class ReworkStatColumnsInBaseClasses < ActiveRecord::Migration
  def change
    change_table :base_classes do |t|
      t.remove :primary_stat
      t.remove :seconardy_stat
      t.remove :range
      t.integer :stamina_index
      t.integer :strength_index
      t.integer :agility_index
      t.integer :spell_power_index
      t.integer :wit_index
    end
  end
end
