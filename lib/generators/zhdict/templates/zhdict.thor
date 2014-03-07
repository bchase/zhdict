require 'active_support/inflector'
require 'zhdict'

class Zhdict < Thor
  desc 'seed WORD_MODEL_NAME', 'seed given model with CEDict words'
  def seed(word_model_name)
    require './config/environment'

    word_class = word_model_name.classify.constantize
    ::Zhdict::CEDict.seed(word_class)
  end
end
