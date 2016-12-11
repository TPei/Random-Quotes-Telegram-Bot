require 'telegram/bot'
require 'dotenv'
require './lib/command_watcher'
require './lib/message_dispatcher'
Dotenv.load

token = ENV['BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text
      responses = []
      chat_id = message.chat.id

      if message.text.start_with? '/image'
        image_path = "./images/*"
        images = Dir[image_path]
        bot.api.send_photo(chat_id: chat_id, photo: Faraday::UploadIO.new(images.sample, 'image/jpeg'))
      elsif message.text.start_with? '/gif'
        image_path = "./gifs/*"
        images = Dir[image_path]
        bot.api.send_document(chat_id: chat_id, document: Faraday::UploadIO.new(images.sample, 'image/gif'))
      else
        if message.text.start_with? '/'
          responses.push CommandWatcher.parse(message.text)
        end

        mdp = MessageDispatcher.new(bot: bot, chat_id: chat_id)
        mdp.dispatch_batch(responses)
      end
    end
  end
end
