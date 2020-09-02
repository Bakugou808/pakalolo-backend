class ChangeColumnOnSmokeLists < ActiveRecord::Migration[6.0]
  def change
    change_column_null :smoke_lists, :entry_id, true
  end
end
