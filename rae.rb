require 'sinatra'
require 'httparty'
require 'nokogiri'

RAE_URL = 'https://dle.rae.es/'
RAE_URL_RANDOM = 'https://dle.rae.es/?m=random'
MEANING_XPATH = '/html/body/div[1]/div[3]/div[1]/section/div[2]/article/p[@class="j"]'
SPLITTER = '/(?=\d+\.\s\w+\.\s)/'

get '/rae' do
  # process the only parameter required. URL EXAMPLE: http://localhost:4567/rae?palabra=mate
  word = params[:palabra]

  # request to RAE the same as through webpage
  response = HTTParty.get(RAE_URL + word)
  doc = Nokogiri::HTML(response.body)

  # gets the specific meanings from the html and split them into an array
  content = doc.xpath(MEANING_XPATH).text.split(SPLITTER)

  # returns the resulting array in json format (not really, is a list of strings)
  content.to_json
end

# all rights reserved RAE Real Academia Española


