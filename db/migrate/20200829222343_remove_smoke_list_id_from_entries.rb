class RemoveSmokeListIdFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :smoke_list_id, :int
  end
end
