class EntriesSmokeLists < ActiveRecord::Migration[6.0]
  def change
    create_table :entries_smoke_lists, :id => false do |t|
      t.integer :entry_id
      t.integer :smoke_list_id
    end
  end
end
