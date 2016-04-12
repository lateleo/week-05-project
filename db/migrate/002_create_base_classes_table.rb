class CreateBaseClassesTable < ActiveRecord::Migration
  def change
    create_table :base_classes do |t|
      t.string :name
      t.string :range
      t.string :role
      t.string :armor_type
      t.string :primary_stat
      t.string :seconardy_stat
      t.text :flavor_text
    end
  end
end
