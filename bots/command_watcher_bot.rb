require 'net/http'
require 'json'

class CommandWatcherBot
  def initialize(text:)
    @text = text
  end

  def check_all
    args = @text.split(' ')
    case args.first
    when '/start'
      'Wubba Lubba Dub Dub!'
    when '/quote'
      url = URI.parse('http://rickandmortyquotes.eu-central-1.elasticbeanstalk.com')
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
end
