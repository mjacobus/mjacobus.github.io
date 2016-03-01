require 'json'
require 'net/http'

feed="daily_english_expression.json"
feed_url = "http://letsmasterenglish.com/radio-api/ee?limit=10000&offset=0"

def get_contents(url)
  Net::HTTP.get_response(URI.parse(url)).body
end


json_contents = get_contents(feed_url)
episodes = JSON.parse(json_contents)

class Episode
  def initialize(data)
    @data = data
  end

  def title
    @data["title"]
  end

  def expression
    exp = title.split("PODCAST").last
    exp = exp.split('Podcast').last
    exp = exp.split('podcast').last
    exp = exp.split(number).last
    exp = exp.gsub(/^[-_—\s:]+/, '')

    if exp.strip.empty?
      return '??'
    end

    exp
  end

  def number
    @data['title'].match(/\d+/)[0]
  end

  def url
    @data["url"]
  end
end

episodes.each do |data|
  episode = Episode.new(data)

  puts "- [#{episode.expression}](#{episode.url || '??'})"
end
