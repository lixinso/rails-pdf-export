require 'open-uri'
require 'nokogiri'

# Perform a google search
doc = Nokogiri::HTML(open('http://google.com/search?q=tenderlove'))

# Print out each link using a CSS selector
doc.css('h3.r > a.l').each do |link|
  puts link.content
end
