class CreatePrestigeLevelsTable < ActiveRecord::Migration
  def change
    create_table :prestige_levels do |t|
      t.integer :levels
      t.integer :character_id
      t.integer :prestige_class_id
    end
  end
end
