class RemoveCharactersPrestigeClassesJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :characters, :prestige_classes
  end
end
