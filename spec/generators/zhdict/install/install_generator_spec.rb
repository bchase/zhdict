require 'spec_helper'
require 'generators/zhdict/install/install_generator'


describe Zhdict::Generators::InstallGenerator do
  # destination File.expand_path("../../../../../tmp", __FILE__)
  # before { prepare_destination }

  describe 'installation' do
    before do
      run_generator %w(Word)
    end

    describe 'the generated model' do
      subject { file 'app/models/word.rb' }
      it {is_expected.to exist}
      it {is_expected.to contain(/class Word < Zhdict::Word/)}
    end
  end
end
