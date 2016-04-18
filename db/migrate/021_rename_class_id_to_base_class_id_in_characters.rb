class RenameClassIdToBaseClassIdInCharacters < ActiveRecord::Migration
  def change
    rename_column :characters, :class_id, :base_class_id
  end
end
