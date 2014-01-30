module Zhdict
  class Dictionary
    def initialize(path='dicts/')
      @file = File.open path
    end
  end
end
