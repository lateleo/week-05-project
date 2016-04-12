class CreateAbilitiesBaseClassesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :abilities, :base_classes
  end
end
