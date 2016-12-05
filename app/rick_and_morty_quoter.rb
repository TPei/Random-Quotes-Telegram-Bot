require 'net/http'
require 'json'

URL = 'http://rickandmortyquotes.eu-central-1.elasticbeanstalk.com'

class RickAndMortyQuoter
  def self.start
    'Wubba Lubba Dub Dub'
  end

  def self.quote
    url = URI.parse(URL)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end

    quote = JSON.parse(res.body)

    <<-QUOTE
    #{quote['what']}
      - #{quote['who']} (#{quote['when']})
    QUOTE
  end
end
