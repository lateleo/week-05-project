class RemoveUnnecessaryColumnsInAbilitiesTable < ActiveRecord::Migration
  def change
    change_table :abilities do |t|
      t.remove :damage_type
      t.remove :base_damage
      t.remove :interval
      t.remove :range
      t.remove :effect_size
      t.remove :effect_shape
    end
  end
end
