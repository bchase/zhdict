require 'spec_helper'
require 'generators/zhdict/install/install_generator'

describe Zhdict::Generators::InstallGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)
  before { prepare_destination }

  describe 'installation' do
    it 'should run all tasks in the generator' do
      gen = generator %w(Word)
      gen.should_receive :generate_zhdict_model
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
        it { should contain(/class Word < Zhdict::Word/) }
      end

      describe 'the migration' do
        subject { file Dir.glob(file "db/migrate/*").grep(/zhdict_create_words/).first }
        it { should exist }
        it { should contain(/class ZhdictCreateWords/) }
        it { should contain('create_table(:words)') }
      end
    end
  end
end
