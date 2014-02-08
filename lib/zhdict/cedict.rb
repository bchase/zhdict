module Zhdict
  module CEDict
    DICT_PATH = 'dicts/cedict.txt'

    def self.seed(word_class)
      dictionary_lines.each do |line|
        next unless line_is_entry(line)

        word = word_class.build_from_cedict_line(line)
        word.save
      end
    end

  private
    def self.line_is_entry(line)
      not line.match(%r{^#})
    end

    def self.dictionary_file
      File.open(DICT_PATH)
    end

    def self.dictionary_lines
      dictionary_file.readlines
    end
  end
end
