require 'spec_helper'
require 'generators/zhdict/install/install_generator'

# zhdict/lib/generators/zhdict/zhdict_generator.rb
# zhdict/lib/generators/active_record/zhdict_generator.rb
# zhdict/lib/generators/active_record/templates/migration.rb

describe Zhdict::Generators::InstallGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)
  before { prepare_destination }

  let(:gen) { generator }

  # context 'no arguments' do
  #   it 'defaults to ActiveRecord'
  #   it 'defaults model name to Entry'
  # end

  context 'ActiveRecord (default)' do
    describe 'installation' do
      it 'should run all tasks in the generator' do
        gen.should_receive :generate_zhdict_active_record_model
        gen.should_receive :generate_zhdict_migration
        capture(:stdout) { gen.invoke_all }
      end

      describe 'generated files' do
        before do
          run_generator %w(Word)
        end

        describe 'the model' do
          subject { file 'app/models/word.rb' }
          it { should exist }
          it { should contain(/class Word < ActiveRecord::Base/) }
          it { should contain(/include Zhdict::Word/) }
        end

        describe 'the migration' do
          subject { file Dir.glob(file "db/migrate/*").grep(/zhdict_create_words/).first }
          it { should exist }
          it { should contain(/class ZhdictCreateWords/) }
          it { should contain('create_table(:words)') }
        end

        describe 'the Thor task' do
          subject { file 'lib/tasks/zhdict.thor' }
          it { should exist }
          it { should contain(/class Zhdict < Thor/) }
        end
      end
    end
  end

  # context 'ActiveRecord (default)' do
  #   describe 'installation' do
  #     it 'should run all tasks in the generator' do
  #       gen.should_receive :generate_zhdict_model
  #       gen.should_receive :generate_zhdict_migration
  #       capture(:stdout) { gen.invoke_all }
  #     end

  #     describe 'generated files' do
  #       before do
  #         run_generator %w(Word)
  #       end

  #       describe 'the model' do
  #         subject { file 'app/models/word.rb' }
  #         it { should exist }
  #         it { should contain(/class Word < ActiveRecord::Base/) }
  #         it { should contain(/include Zhdict::Word/) }
  #       end

  #       describe 'the migration' do
  #         subject { file Dir.glob(file "db/migrate/*").grep(/zhdict_create_words/).first }
  #         it { should exist }
  #         it { should contain(/class ZhdictCreateWords/) }
  #         it { should contain('create_table(:words)') }
  #       end

  #       describe 'the Thor task' do
  #         subject { file 'lib/tasks/zhdict.thor' }
  #         it { should exist }
  #         it { should contain(/class Zhdict < Thor/) }
  #       end
  #     end
  #   end
  # end
end
