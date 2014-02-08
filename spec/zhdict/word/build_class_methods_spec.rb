require 'spec_helper'
require 'test_models'

describe Zhdict::Word::BuildClassMethods do
  describe '.build_from_cedict_line' do
    let(:cedict_line) {
      '還 还 [hai2] /still/still in progress/still more/yet/even more/in addition/fairly/passably (good)/as early as/even/also/else/'
    }
    let(:word) { Word.build_from_cedict_line(cedict_line) }

    # subject { word.traditional_characters }
    # it { should eq('還') }

    # subject { word }
    it 'properly parses the CEDict line' do
      word.traditional_characters.should eq('還')
      word.simplified_characters.should eq('还')
      word.pronunciation.should eq('hai2')
      word.glosses.split("\n").first.should eq('still')

      word.raw_entry.should eq(cedict_line)
    end
  end
end
