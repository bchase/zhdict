require 'spec_helper'

describe Zhdict::Word do
  describe '.included' do
    let(:word_class) { 
      Class.new do
        include Zhdict::Word
      end
    }
    before do
      word_class.any_instance.stub(:read_attribute).and_return("foo\nbar\nbaz")
    end


    describe 'included class' do
      subject { word_class }
      it { should respond_to(:build_from_cedict_line) }
      it { should respond_to(:search_by_hanzi) }
    end

    describe 'included class instance' do
      let(:glosses) { ['foo', 'bar', 'baz']}
      subject { word_class.new.glosses }
      it { should eq(glosses) }
    end
  end
end
