require 'active_record'

module Zhdict
  module Word
    module ClassMethods
      def self.create_from_cedict_line(cedict_line)
        self.raw = cedict_line

        word = parse_cedict_line(cedict_line)

        self.traditional_characters = word[:trad]
        self.simplified_characters  = word[:simp]
        self.pronunciation          = word[:pron]
        self.glosses                = word[:glosses]
      end

      # def search_by_hanzi?(str)
      #   idx = str.length - 1
      #   while size >= 0
      #     slice = str[0..idx]
      #     # TODO
      #     idx -= 1
      #   end
      # end

    private
      CEDICT_RE = %r{^([\w\p{Han}]+) ([\w\p{Han}]+) \[(.+)\] /(.*)/$}
      #             # trad           simp             pron    glosses

      def parse_cedict_line(cedict_line)
        match = cedict_line.match(CEDICT_RE)
        {
          trad:    match[1],
          simp:    match[2],
          pron:    match[3], 
          glosses: match[4].split('/').join("\n")
        }
      end
    end

    # alias :trad :traditional_characters
    # alias :simp :simplified_characters
    # alias :pron :pronunciation

  end
end
