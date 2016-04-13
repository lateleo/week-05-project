class AddAbilityIdColumnInRacialAbilitiesTable < ActiveRecord::Migration
  def change
    add_column :racial_abilities, :ability_id, :string
  end
end
