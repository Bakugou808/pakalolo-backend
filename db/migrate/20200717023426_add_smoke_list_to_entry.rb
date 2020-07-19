class AddSmokeListToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :smoke_list, index: true
  end
end
