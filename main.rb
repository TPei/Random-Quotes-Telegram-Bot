require 'telegram/bot'
require 'dotenv'
require './bots/quality_assurance_bot'
require './bots/command_watcher_bot'
require './bots/commenter_bot'
require './message_dispatcher'
Dotenv.load

token = ENV['BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text
      responses = []
      chat_id = message.chat.id

      if message.text.start_with? '/'
        responses.push CommandWatcherBot.new(text: message.text).check_all
      end

      mdp = MessageDispatcher.new(bot: bot, chat_id: chat_id)
      mdp.dispatch_batch(responses)
    end
  end
end
