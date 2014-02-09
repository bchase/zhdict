ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

require 'ammeter/init'

require 'pry'

# require 'rails/all'
# require 'rspec/collection_matchers'


Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  # config.filter_run :focus
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end

def seed_test_db
  Zhdict::CEDict.
    stub(:dictionary_entry_lines).
    and_return(cedict_test_entries)
  Zhdict::CEDict.seed(Word)
end

def cedict_test_entries
  [
    "還 还 [hai2] /still/still in progress/still more/yet/even more/in addition/fairly/passably (good)/as early as/even/also/else/", # single char '還'
    "還 还 [huan2] /to pay back/to return/", # single char, diff pron
    "還好 还好 [hai2 hao3] /not bad/tolerable/fortunately/", # two char, initial
    "交還 交还 [jiao1 huan2] /to return sth/to hand back/", # two char, non-initial
    "無關 无关 [wu2 guan1] /unrelated/having nothing to do (with sth else)/" # w/o char
  ]
end
