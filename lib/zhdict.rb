# encoding: UTF-8

require "zhdict/version"
# require "zhdict/dictionary"

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

  Word = Struct.new :traditional_characters, :simplified_characters, :pronunciation, :glosses, :line do
    alias :trad :traditional_characters
    alias :simp :simplified_characters
    alias :pron :pronunciation

    CEDICT_RE = %r{^([\w\p{Han}]+) ([\w\p{Han}]+) \[(.+)\] /(.*)/$}
    #             # trad           simp             pron    glosses
    def initialize(cedict_line)
      cedict_line.match(CEDICT_RE)

      trad, simp, pron, glosses = $1, $2, $3, $4
      glosses = glosses.split('/') if glosses

      super trad, simp, pron, glosses, cedict_line
    end

    def match?(attribute, str)
      case attribute
      when :hanzi
        match_hanzi? str
      when :pronunciation
        match_pronunciation? str
      when :gloss
        match_gloss? str
      end
    end

    def match_hanzi?(str)
      idx = str.length - 1
      while size >= 0
        slice = str[0..idx]

        return true if slice == trad or slice == simp

        idx -= 1
      end
    end

    def match_pronunciation?(str)      
      false
    end
    def match_gloss?(str)      
      false
    end
  end
end
