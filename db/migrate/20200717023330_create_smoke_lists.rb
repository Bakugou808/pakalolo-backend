class CreateSmokeLists < ActiveRecord::Migration[6.0]
  def change
    create_table :smoke_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
