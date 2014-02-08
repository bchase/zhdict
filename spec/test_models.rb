module Test
  Word = Struct.new :raw, :traditional_characters, :simplified_characters, :pronunciation, :glosses do
    extend Zhdict::Word::BuildClassMethods
  end
end
