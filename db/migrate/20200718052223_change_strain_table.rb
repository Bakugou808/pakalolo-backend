class ChangeStrainTable < ActiveRecord::Migration[6.0]
  def change
    change_column :strains, :cannabinoidList, :text
  end
end
