require 'telegram/bot'
require 'nokogiri'
require 'open-uri'
require 'uri'
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
#puts greeting.random_holiday

# construct EN google image search results page
url = URI.encode("https://www.google.com/search?q=#{greeting.random_holiday}&hl=ru&tbm=isch" )
puts("here111", url)

# scrape google images
doc = Nokogiri::HTML.parse(open(url).read)

# store all image urls on the first search page in an array
imgs = doc.search('img').map(&:attributes).map { |node| node['src'].value }

# filter bad urls
imgs.select { |url| url.match(/https/) }
#puts imgs

# print and return random image url
image = imgs[1]
puts("HERE222", image)

Telegram::Bot::Client.run(api_key) do |bot|
    bot.listen do |message|

end
end