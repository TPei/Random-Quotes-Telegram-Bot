require 'telegram/bot'
require 'dotenv'
require './lib/command_watcher'
require './lib/message_dispatcher'
Dotenv.load

token = ENV['BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text
      dispatcher = MessageDispatcher.new(bot: bot, chat_id: message.chat.id)

      if message.text.start_with? '/image'
        image_path = "./images/*"
        images = Dir[image_path]
        dispatcher.send(photo: images.sample)
      elsif message.text.start_with? '/gif'
        image_path = "./gifs/*"
        gifs = Dir[image_path]
        dispatcher.send(gif: gifs.sample)
      elsif message.text.start_with? '/'
        dispatcher.send(text: CommandWatcher.parse(message.text))
      end
    end
  end
end
