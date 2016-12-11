# Rick and Morty Quotes Telegram Bot
## What does it do?
Uses [Rick and Morty Quotes Web Service](http://rickandmortyquotes.eu-central-1.elasticbeanstalk.com/)
to bring your favorite quotes to your telegram chats.

Provides three commands: `/start` to start the conversation, check if it
is running. `/quote` to get a random quote and `/quote id` to get a
specific quote given a certain id.

In group chats with multiple Bots it might be necessary to type
`/quote@RickAndMortyQuoterBot` to send commands to the bot.

You can easily add the Bot to your chats. Just add
[RickAndMortyQuoterBot](https://telegram.me/RickAndMortyQuoterBot).

![bot demo](https://raw.githubusercontent.com/TPei/Random-Quotes-Telegram-Bot/master/bot_demo_3.png)


Uses the code from [this](https://github.com/TPei/random_quotes) repo.
Feel free to fork it with your own quotes :)

## How do I use it?
Deploy the Code, provide your [Telegram API Token](https://telegram.me/BotFather) and simply run with ruby main.rb

