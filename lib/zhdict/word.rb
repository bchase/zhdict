require 'active_record'

# TODO move
class String
  def slices_front_to_back
    str = ''
    self.split('').map do |ch|
      (str << ch).dup
    end
  end
end

module Zhdict
  module Word
    module BuildClassMethods
      def build_from_cedict_line(cedict_line)
        w = parse_cedict_line(cedict_line)
        # require 'pry'
        # binding.pry

        word = self.new \
          raw_entry:              cedict_line,
          traditional_characters: w[:trad],
          simplified_characters:  w[:simp],
          pronunciation:          w[:pron],
          glosses:                w[:glosses]
      end

    private
      CEDICT_RE = %r{^([\w\p{Han}]+) ([\w\p{Han}]+) \[(.+)\] /(.*)/$}
      #                trad           simp             pron    glosses

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

    module SearchClassMethods
      def find_by_hanzi(str)
        search_strs = str.slices_front_to_back
        search_strs.map do |search_str|
          # Word.where trad or simp == str
        # TODO move reverse/reject
        end.reject(&:nil?).reverse
      end
    end

    # alias :trad :traditional_characters
    # alias :simp :simplified_characters
    # alias :pron :pronunciation
  end
end
