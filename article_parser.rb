
require 'yandex_speech'

def parse_article(article_url)

  puts "I got #{article_url}"
  article_doc = Nokogiri::HTML(open(article_url))

  article_doc.css('div#topic').each do |topic|

    topic.css('h1.topic-name').each do |topic_name|
      puts topic_name.content
    end


    topic.css('div.topic-text').each do |topic_text|
      puts topic_text.content
    end

  end

end
