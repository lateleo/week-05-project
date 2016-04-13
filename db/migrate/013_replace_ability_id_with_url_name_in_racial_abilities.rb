class ReplaceAbilityIdWithUrlNameInRacialAbilities < ActiveRecord::Migration
  def change
    change_table :racial_abilities do |t|
      t.remove :ability_id
      t.string :url_name
    end
  end
end
