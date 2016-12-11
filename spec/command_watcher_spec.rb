require 'spec_helper'
require 'json'
require './lib/command_watcher.rb'

RSpec.describe CommandWatcher do
  def app
    CommandWatcher
  end

  describe '.parse' do
    it 'delegates /start and /quote to RandomQuoter' do
      expect(RandomQuoter).to receive(:start)
      CommandWatcher.parse('/start')
      expect(RandomQuoter).to receive(:quote).with nil
      CommandWatcher.parse('/quote')
      expect(RandomQuoter).to receive(:quote).with 'test'
      CommandWatcher.parse('/quote test')
    end

    it 'responds to /help' do
      expect(CommandWatcher.parse('/help').include? '/start').to eq true
    end

    it 'responds to /info' do
      expect(CommandWatcher.parse('/info').include? '@tpei_bots').to eq true
    end

    it 'ignores superfluous arguments' do
      expect(RandomQuoter).to receive(:start)
      CommandWatcher.parse('/start wubba lubba dub dub')
    end
  end
end
