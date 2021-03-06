require 'spec_helper'

describe Zhdict::Word::SearchClassMethods do
  before do
    seed_test_db # spec_helper
  end

  describe '.starts_with_hanzi' do
    let(:words) { Word.starts_with_hanzi(hanzi) }

    context 'with traditional characters' do
      let(:hanzi) { '還' }
      it 'finds words' do
        words.count.should eq(3)
      end
    end

    context 'with simplified characters' do
      let(:hanzi) { '还' }
      it 'finds words' do
        words.count.should eq(3)
      end
    end
  end

  describe '.find_by_hanzi' do
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

  describe '.search_by_hanzi' do
    let(:words) { Word.search_by_hanzi(hanzi) }


    # TODO clean up `traditional_words`
    context 'with traditional characters' do
      let(:hanzi) { '還好' }
      let(:traditional_words) { words.map {|arr| arr.map(&:traditional_characters)} }
      it 'finds words' do
        traditional_words.should eq([['還好'],['還','還']])
      end
    end

    # TODO clean up `simplified_words`
    context 'with simplified characters' do
      let(:hanzi) { '还好' }
      let(:simplified_words) { words.map {|arr| arr.map(&:simplified_characters)} }
      it 'finds words' do
        simplified_words.should eq([['还好'],['还','还']])
      end
    end
  end

  # describe '.starts_with_hanzi_iterative' do
  #   let(:hanzi) { '還好' }
  #   let(:words) { Word.starts_with_hanzi_iterative(hanzi) }
  #   let(:traditional_words) { words.map {|arr| arr.map(&:traditional_characters)} }

  #   context 'with traditional characters' do
  #     it 'finds words' do
  #       traditional_words.should eq([['還好'],'還','還'])
  #     end
  #   end
  # end
end
