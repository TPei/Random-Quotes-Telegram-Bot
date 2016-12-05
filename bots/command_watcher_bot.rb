require './app/rick_and_morty_quoter.rb'

class CommandWatcherBot
  def initialize(text:)
    @text = text
  end

  def check_all
    args = @text.split(' ')
    if args[0].include?('/start')
      RickAndMortyQuoter.start
    elsif args[0].include?('/quote')
      RickAndMortyQuoter.quote args[1]
    end
  end
end
