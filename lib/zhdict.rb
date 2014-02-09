# encoding: UTF-8

require "zhdict/version"
# require "zhdict/dictionary"
require "zhdict/word"
require "zhdict/cedict"

module Zhdict
  if defined?(Rails)
    require 'zhdict/engine' 
    require 'zhdict/railtie'
  end
end
