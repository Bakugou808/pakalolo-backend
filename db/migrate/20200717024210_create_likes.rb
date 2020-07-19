class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
