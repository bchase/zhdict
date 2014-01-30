require 'active_record'

module Zhdict
  class Word < ActiveRecord::Base
    # alias :trad :traditional_characters
    # alias :simp :simplified_characters
    # alias :pron :pronunciation

    def self.create_from_cedict_line(cedict_line)
      self.raw = cedict_line

      word = parse_cedict_line(cedict_line)

      self.traditional_characters = word[:trad]
      self.simplified_characters  = word[:simp]
      self.pronunciation          = word[:pron]
      self.glosses                = word[:glosses]
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

  private
    CEDICT_RE = %r{^([\w\p{Han}]+) ([\w\p{Han}]+) \[(.+)\] /(.*)/$}
    #             # trad           simp             pron    glosses

    def parse_cedict_line(cedict_line)
      cedict_line.match(CEDICT_RE)
      {
        trad:    $1,
        simp:    $2,
        pron:    $3, 
        glosses: $4.split('/').join("\n")
      }
    end
  end
end
