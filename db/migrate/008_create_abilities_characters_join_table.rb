class CreateAbilitiesCharactersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :abilities, :characters
  end
end
