module Zhdict
  class Dictionary
    def initialize(path='dicts/cedict.txt')
      @file  = File.open path
      @words = Array.new

      load_words

      puts @words.count

      p find hanzi: '㗂㘭'
    end

    def load_words
      @file.each do |line|
        next if line.match(%r{$#})
        @words << Word.new(line.chomp)
      end
    end

    def find(search={pronunciation: 'dei3'})
      attribute, str = nil, ''
      search.each do |k,v| attribute, str = k, v end

      @words.select do |word|
        word.match? attribute, str
      end
    end
  end
end
