class CreateCharactersPrestigeClassesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :characters, :prestige_classes
  end
end
