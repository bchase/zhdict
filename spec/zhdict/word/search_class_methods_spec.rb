require 'spec_helper'

describe Zhdict::Word::SearchClassMethods do
  before do
    seed_test_db # spec_helper
  end

  describe '.search_by_hanzi' do
    let(:words) { Word.find_by_hanzi(hanzi) }

    context 'with traditional characters' do
      let(:hanzi) { '還' }
      it 'finds words' do
        words.count.should eq(2)
      end
    end

    context 'with simplified characters' do
      let(:hanzi) { '还' }
      it 'finds words' do
        words.count.should eq(2)
      end
    end
  end
end
