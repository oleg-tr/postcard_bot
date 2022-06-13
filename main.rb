require 'telegram/bot'
require 'requests'
require_relative 'helpers.rb'
require_relative 'config/api_key_override.rb'

api_key = $TOKEN

class Greeting
    def random_holiday     
        x = rand(1..10)
         x.even? ? "С днем #{$adjs_male.sample} #{$nouns_male.sample}" : "С днем #{$adjs_female.sample} #{$nouns_female.sample}"
    end
end

greeting = Greeting.new
puts greeting.random_holiday

response = Requests.request("GET", "https://yandex.ru/images/search?text=fork", options: {})

# And again you get a response
puts response.status  #=> Number with the status code
puts response.headers #=> Hash with the response headers
puts response.body    #=> String with the response body

Telegram::Bot::Client.run(api_key) do |bot|
    bot.listen do |message|

end
end