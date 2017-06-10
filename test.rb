require 'nokogiri'
require 'open-uri'
require_relative "./article_parser"
# Fetch and get Number of pages in vb.kg

pages = Nokogiri::HTML(open("http://www.vb.kg/?search="))

num_pages=1
pages.css('div.paginator a').each do |page_link|
  page_n=page_link.text.to_i
  if page_n>num_pages
    num_pages=page_n
  end
end

puts "Max page: #{num_pages}"

(1...num_pages).each do |i|

  page_num = i

  url = "http://www.vb.kg/?sort_by=date&search=&page=#{page_num}"

  doc = Nokogiri::HTML(open(url))

  # puts doc.text
  puts "### Search article nodes by css"

    doc.css('div.cat_content ul li').each do |link|
      date_created = link.css("span.topic_time_create")
      puts "Date published: #{ date_created.text}"
      article_title = link.css("div.t .n")
      puts "Article title: #{article_title.text}"

      article_img = link.css("img.img-resize")[0]

      # puts article_img
      article_img_src=nil

      if article_img!=nil
        article_img_src =  article_img['data-src']
        # puts "Image url: #{article_img_src}"
      end

        # puts "image url: #{article_img.attribute('data-src')}"
      article_link=link.css("div.t a")[0]['href']
      puts "Article Link: #{article_link}"

      # parse_article(article_link) # Parse Single Article

      # link.css("div.t a").map {|hr|
      # article_link =  hr['href']
      #   puts "Article link: #{article_link}"
      # }

      puts "_________________________________"

    end

end
