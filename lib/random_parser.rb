require 'json'

class RandomParser
  def initialize(file)
    #file = File.read(...)
    data_hash = JSON.parse(file)
    @quotes = data_hash['quotes']
  end

  def quotes
    @quotes
  end

  def random_entry
    quotes.sample
  end

  def self.random_entry(file)
    new(file).random_entry
  end
end
