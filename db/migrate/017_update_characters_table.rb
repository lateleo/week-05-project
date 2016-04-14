class UpdateCharactersTable < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.rename :level, :base_level
      t.integer :character_level
    end
  end
end
