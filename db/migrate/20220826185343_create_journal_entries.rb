class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.text :title
      t.text :text
      t.integer :journal_id

      t.timestamps
    end
  end
end
