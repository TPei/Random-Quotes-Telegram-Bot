require 'spec_helper'
require 'json'
require './lib/random_parser.rb'

RSpec.describe RandomParser do
  def app
    RandomParser
  end

  describe '#random_entry' do
    it 'returns a random object from @quotes' do
      parser = RandomParser.new(File.read('./quotes/quotes.json'))
      expect(parser).to receive(:quotes).and_call_original
      parser.random_entry
    end
  end
end
