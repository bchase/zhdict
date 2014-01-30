require 'spec_helper'
require 'generators/zhdict/install/install_generator'

describe Zhdict::Generators::InstallGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)
  before { prepare_destination }

  describe 'installation' do
    it 'should run all tasks in the generator' do
      gen = generator %w(Word)
      gen.should_receive :generate_zhdict_model
      capture(:stdout) { gen.invoke_all }
    end

    describe 'the generated model' do
      before do
        run_generator %w(Word)
      end

      subject { file 'app/models/word.rb' }
      it { should exist }
      it { should contain(/class Word < Zhdict::Word/) }
    end
  end
end
