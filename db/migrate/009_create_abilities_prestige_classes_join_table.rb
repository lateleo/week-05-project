class CreateAbilitiesPrestigeClassesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :abilities, :prestige_classes
  end
end
