class ZhdictCreateWords < ActiveRecord::Migration
  def change
    create_table(:words) do |t|
      t.string :traditional_characters
      t.string :simplified_characters
      t.string :pronunciation
      t.text   :glosses

      t.string :raw_entry

      # t.timestamps
    end
  end
end
