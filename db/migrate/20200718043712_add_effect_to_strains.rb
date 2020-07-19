class AddEffectToStrains < ActiveRecord::Migration[6.0]
  def change
    add_column :strains, :effects, :string
  end
end
