class ChangeStrainTableTerpeneList < ActiveRecord::Migration[6.0]
  def change
    change_column :strains, :terpeneList, :text
  end
end
