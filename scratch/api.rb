### sh ###
`rake zhdict:install Word`

### app/models/word.rb ###
class Word < Zhdict::Word
end

### db/migrate/XXXX_create_word.rb ###
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

######
words = Word.search_by_hanzi '做'

words = Word.search_by_pronunciation 'zuo4'

words = Word.search_by_gloss 'to make'
