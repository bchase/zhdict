require 'spec_helper'
require 'test_models'

describe Zhdict::Word::BuildClassMethods do
  describe '.build_from_cedict_line' do
    let(:cedict_line) {
      "做 做 [zuo4] /to do/to make/to produce/to write/to compose/to act as/to engage in/to hold (a party)/to be/to become/to function (in some capacity)/to serve as/to be used for/to form (a bond or relationship)/to pretend/to feign/to act a part/to put on appearance/"
    }
    let(:word) { Word.build_from_cedict_line(cedict_line) }

    subject { word.traditional_characters }
    it { should be('做') }

    # it 'adds the right attribute values from the line' do
    # end
  end
end
