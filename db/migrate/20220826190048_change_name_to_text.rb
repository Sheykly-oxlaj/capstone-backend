class ChangeNameToText < ActiveRecord::Migration[7.0]
  def change
    change_column :journals, :name, :text
  end
end
