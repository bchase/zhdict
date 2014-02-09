# encoding: UTF-8

require "zhdict/version"
# require "zhdict/dictionary"
require "zhdict/word"
require "zhdict/cedict"

module Zhdict
  require 'zhdict/engine' if defined?(Rails)
end
