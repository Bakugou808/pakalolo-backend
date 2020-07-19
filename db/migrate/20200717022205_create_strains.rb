class CreateStrains < ActiveRecord::Migration[6.0]
  def change
    create_table :strains do |t|
      t.string :name
      t.string :genus
      t.string :flavorList
      t.string :description
      t.string :cannabinoidList
      t.string :terpeneList

      t.timestamps
    end
  end
end
