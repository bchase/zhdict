module Zhdict
  module CEDict
    DICT_PATH = 'dicts/cedict.txt'

    def self.seed(word_class)
      dictionary_entry_lines.each do |line|
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

    def self.dictionary_entry_lines
      dictionary_lines.select {|line| line_is_entry(line)}
    end
  end
end
