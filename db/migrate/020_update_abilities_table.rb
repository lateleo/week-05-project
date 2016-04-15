class UpdateAbilitiesTable < ActiveRecord::Migration
  def change
    change_table :abilities do |t|
      t.rename :description, :in_game_effect
      t.text :flavor_text
      t.string :cooldown
    end
  end
end
