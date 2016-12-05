require 'net/http'
require 'json'

URL = 'http://rickandmortyquotes.eu-central-1.elasticbeanstalk.com'

class RickAndMortyQuoter
  def self.start
    'Wubba Lubba Dub Dub'
  end


  def self.quote(id)
    url = URL
    url += '/' + id unless id.nil?
    url = URI.parse(url)
    req = Net::HTTP::Get.new(url.to_s)

    begin
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end

      quote = JSON.parse(res.body)
    rescue Exception
      quote = base_quote
    end

    <<-QUOTE
    #{quote['what']}
      - #{quote['who']} (#{quote['when']}, quote: #{quote['id'] || 'fallback'})
    QUOTE
  end

  def self.base_quote
    {
      'what' => 'The service might be down! This is a fallback quote. Wubba Lubba Dub Dub, amiright?',
      'who' => 'Rick',
      'when' => 'Season 1, Episode 5'
    }
  end
end
