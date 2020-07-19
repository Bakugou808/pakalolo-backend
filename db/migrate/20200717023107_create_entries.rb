class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
