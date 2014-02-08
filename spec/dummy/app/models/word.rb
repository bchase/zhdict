class Word < ActiveRecord::Base
  extend Zhdict::Word::BuildClassMethods
  extend Zhdict::Word::SearchClassMethods
end
