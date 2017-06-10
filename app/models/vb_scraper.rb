require 'nokogiri'
require 'open-uri'
require_relative "./article_parser"
# Fetch and get Number of pages in vb.kg
class VbScraper

  def initialize

  end

   @@instance = VbScraper.new

   def self.instance
     return @@instance
   end

   def log(msg)
     @log.puts(msg)
   end

  private_class_method :new

  def max_page
    pages = Nokogiri::HTML(open("http://www.vb.kg/?search="))
    num_pages=1
    pages.css('div.paginator a').each do |page_link|
      page_n=page_link.text.to_i
      if page_n>num_pages
        num_pages=page_n
      end
    end

    return num_pages
  end

  def all_pages
    (1...num_pages).each do |i|
      page_num = i
      url = "http://www.vb.kg/?sort_by=date&search=&page=#{page_num}"

      page_by_number(url)

    end
  end

  def page_by_number(url)

    doc = Nokogiri::HTML(open(url))
      doc.css('div.cat_content ul li').each do |link|
        date_created = link.css("span.topic_time_create")
        puts "Date published: #{ date_created.text}"
        article_title = link.css("div.t .n")
        puts "Article title: #{article_title.text}"
        article_img = link.css("img.img-resize")[0]
        article_img_src=nil
        if article_img!=nil
          article_img_src =  article_img['data-src']
        end
        article_link=link.css("div.t a")[0]['href']
        puts "Article Link: #{article_link}"
        puts "_________________________________"

      end
  end


end
