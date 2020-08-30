class RemoveEntryIdFromSmokeLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :smoke_lists, :entry_id, :int
  end
end
