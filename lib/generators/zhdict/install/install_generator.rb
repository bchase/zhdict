require 'rails/generators'
require 'rails/generators/migration'

module Zhdict
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::ResourceHelpers
      include Rails::Generators::Migration

      namespace 'zhdict'
      argument :model_name, type: :string, default: 'Word'
      # class_option :mongoid, type: :boolean, default: false, description: "Use Mongoid for ORM. Defaults to ActiveRecord."
      source_root File.expand_path('../templates', __FILE__)

      desc "Generates a model with the given NAME as a means" <<
           "of persisting and querying CEDict words."

      def generate_zhdict_model
        template 'model.rb.erb', "app/models/#{file_name}.rb"
      end

      def generate_zhdict_migration
        migration_template 'migration.rb.erb', "db/migrate/zhdict_create_#{file_name.pluralize}.rb"
      end

      def generate_zhdict_thor_task
        copy_file 'zhdict.thor', "lib/tasks/zhdict.thor"
      end

      def name
        'Install'
      end

    private
      def file_name
        model_name.underscore
      end

      def table_name
        file_name.pluralize
      end

      def model_class_name
        file_name.classify.to_s
      end

      def self.next_migration_number(path)
        @@migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end
