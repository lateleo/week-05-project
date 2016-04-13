class UpdateRacialAbilitiesTable < ActiveRecord::Migration
  def change
    change_table :racial_abilities do |t|
      t.rename :description, :in_game_effect
      t.string :cooldown
      t.text :flavor_text
    end
  end
end
