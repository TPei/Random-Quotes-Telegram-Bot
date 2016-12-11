require './lib/rick_and_morty_quoter.rb'

class CommandWatcher
  def self.parse(text)
    args = text.split(' ')
    if args[0].include?('/start')
      RickAndMortyQuoter.start
    elsif args[0].include?('/quote')
      RickAndMortyQuoter.quote args[1]
    elsif args[0].include?('/help')
      <<-MESSAGE
/start     - startup message
/quote     - a random quote
/quote :id - the quote with the id :id
/image     - get a random image
/gif       - get a random gif
/help      - this list of commands
/info      - Bot info
      MESSAGE
    elsif args[0].include?('/info')
      <<-MESSAGE
Made by @tpei_bots

The code is open source and can be found here: https://github.com/TPei/Random-Quotes-Telegram-Bot

If there are persisting problems or you'd like to request changes, do so here: https://github.com/TPei/Random-Quotes-Telegram-Bot/issues/new
      MESSAGE
    end
  end
end
