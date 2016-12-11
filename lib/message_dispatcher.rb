class MessageDispatcher
  def initialize(bot:, chat_id:)
    @bot = bot
    @chat_id = chat_id
  end

  def send(text: nil, photo: nil, gif: nil)
    if text
      @bot.api.send_message(chat_id: @chat_id, text: text)
    end

    if photo
      @bot.api.send_photo(chat_id: @chat_id, photo: Faraday::UploadIO.new(photo, 'image/jpeg'))
    end

    if gif
      @bot.api.send_document(chat_id: @chat_id, document: Faraday::UploadIO.new(gif, 'image/gif'))
    end
  end
end
