require 'active_record'

module Zhdict
  module Word
    def self.included(base)
      base.class_eval do
        extend BuildClassMethods
        extend SearchClassMethods

        # alias :__glosses :glosses
        def glosses
          # __glosses.split("\n")
          read_attribute(:glosses).split("\n")
        end
      end
    end

    module BuildClassMethods
      def build_from_cedict_line(cedict_line)
        w = parse_cedict_line(cedict_line)

        word = self.new \
          raw_entry:              cedict_line,
          traditional_characters: w[:trad],
          simplified_characters:  w[:simp],
          pronunciation:          w[:pron],
          glosses:                w[:glosses]
      end

    private
      CEDICT_RE = %r{^([\w\p{Han}，・、]+) ([\w\p{Han}，・、]+) \[(.+)\] /(.*)/}
      #                trad           simp             pron    glosses

      # TODO move to Zhdict::CEDict
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
      def search_by_hanzi(str)
        search_strs = str.slices_back_to_front
        search_strs.map do |search_str|
          find_by_hanzi(search_str).to_a
        # TODO refactor, move reverse/reject
        end.reject(&:nil?).reverse
      end

      def find_by_hanzi(str)
        where ['traditional_characters = ? or simplified_characters = ?', str, str]
      end
      
      def starts_with_hanzi(str)
        where 'traditional_characters LIKE :begin_str or simplified_characters LIKE :begin_str', begin_str: "#{str}%"
      end
    end

    # alias :trad :traditional_characters
    # alias :simp :simplified_characters
    # alias :pron :pronunciation
  end
end

# TODO move
class String
  # def slice(*args, &block)
  #   opts = args.extract_options!

  #   direction = opts[:direction]
  #   order     = opts[:order]

  #   if direction and order
  #     if direction == :back_to_front
  #     elsif direction == :front_to_back
  #     else
  #       raise ArgumentError.new("Invalid :direction #{direction.inspect}")
  #     end

  #     if order == :largest_to_smallest
  #     elsif order == :smallest_to_largest
  #     else
  #       raise ArgumentError.new("Invalid :order #{order.inspect}")
  #     end
  #     str = ''
  #     self.split('').map do |ch|
  #       (str << ch).dup
  #     end
  #   else
  #     super
  #   end
  # end

  def slices_back_to_front
    str = ''
    self.split('').map do |ch|
      (str << ch).dup
    end
  end
end
