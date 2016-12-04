class MessageDispatcher
  def initialize(bot:, chat_id:)
    @bot = bot
    @chat_id = chat_id
  end

  def dispatch_batch(messages)
    messages.each do |message|
      dispatch(message)
    end
  end

  def dispatch(message)
    unless message.nil? || message.empty?
      @bot.api.send_message(chat_id: @chat_id, text: message)
    end
  end
end
