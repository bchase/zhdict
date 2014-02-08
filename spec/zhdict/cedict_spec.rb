require 'spec_helper'

describe Zhdict::CEDict do
  describe '.seed' do
    let(:cedict_lines) {
      [
        "# comment line to be ignored",
        "還 还 [hai2] /still/still in progress/still more/yet/even more/in addition/fairly/passably (good)/as early as/even/also/else/"
      ]
    }

    before do 
      Zhdict::CEDict.stub(:dictionary_lines).and_return(cedict_lines)

      Zhdict::CEDict.seed(Word) 
    end

    describe 'word count' do
      subject { Word.count }
      it { should eq(1) }
    end

    describe 'first entry' do
      subject { Word.first.traditional_characters }
      it { should eq('還') }
    end
  end
end
