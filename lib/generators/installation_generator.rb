module Zhdict
  module Generators
    class InstallationGenerator < Rails::Generators::Base
      include Rails::Generators::ResourceHelpers

      namespace 'zhdict'
      source_root File.expand_path('../templates', __FILE__)

      desc "Generates a model with the given NAME as a means" <<
           "of persisting and querying CEDict words."

      hook_for :orm
    end
  end
end
