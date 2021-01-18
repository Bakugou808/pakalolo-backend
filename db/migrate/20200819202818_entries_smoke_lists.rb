class EntriesSmokeLists < ActiveRecord::Migration[6.0]
  def change
    create_table :entries_smoke_lists do |t|
      t.integer :entry_id, null: false, foreign_key: true
      t.integer :smoke_list_id, null: false, foreign_key: true
    end
  end
end
