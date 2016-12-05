require './app/rick_and_morty_quoter.rb'

class CommandWatcherBot
  def initialize(text:)
    @text = text
  end

  def check_all
    arg = @text.split(' ')[0]

    if arg.include?('/start')
      RickAndMortyQuoter.start
    elsif arg.include?('/quote')
      RickAndMortyQuoter.quote
    end
  end
end
