require 'rails/generators'

module Zhdict
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::ResourceHelpers
      namespace 'zhdict'
      argument :model_name, type: :string
      source_root File.expand_path('../templates', __FILE__)

      desc "Generates a model with the given NAME as a means" <<
           "of persisting and querying CEDict words."

      def generate_zhdict_model
        template 'model.rb.erb', "app/models/#{file_name}.rb"
      end

      def name
        'Foo'
      end

    private
      def file_name
        model_name.underscore
      end
    end
  end
end
