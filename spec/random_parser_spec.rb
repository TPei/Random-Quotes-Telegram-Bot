require 'spec_helper'
require 'json'
require './lib/random_quoter.rb'

RSpec.describe RandomQuoter do
  def app
    RandomQuoter
  end

  describe '#quote' do
    before do
      @quote = {
        'what' => 'Wubba Lubba Dub Dub',
        'who' => 'Rick',
        'when' => 'Season 1, Episode 5',
        'id' => '1234'
      }
    end

    context 'without id' do
      it 'calls #random_entry on RandomParser' do
        allow(RandomParser).to receive(:new).and_return(parser = double)
        expect(parser).to receive(:random_entry).and_return(@quote)
        expect(RandomQuoter.quote(nil)).to eq(
          <<-QUOTE
    Wubba Lubba Dub Dub
      - Rick (Season 1, Episode 5, quote: 1234)
          QUOTE
        )
      end
    end
    context 'with id' do
      context 'that matches a quote' do
        it 'returns the quote' do
          quoter = RandomQuoter.new
          allow(quoter).to receive(:quotes).and_return([@quote])

          expect(quoter.quote('1234')).to eq(
            <<-QUOTE
    Wubba Lubba Dub Dub
      - Rick (Season 1, Episode 5, quote: 1234)
            QUOTE
          )
        end
      end

      context 'that does not have any matching quotes' do
        it 'returns an error text' do
          quoter = RandomQuoter.new
          allow(quoter).to receive(:quotes).and_return([])
          expect(quoter.quote('1234')).to eq('Sorry, there is no quote with that id')
        end
      end
    end
  end
end
