require 'active_record'

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
      # def search_by_hanzi?(str)
      #   idx = str.length - 1
      #   while size >= 0
      #     slice = str[0..idx]
      #     # TODO
      #     idx -= 1
      #   end
      # end
    end

    # alias :trad :traditional_characters
    # alias :simp :simplified_characters
    # alias :pron :pronunciation
  end
end
