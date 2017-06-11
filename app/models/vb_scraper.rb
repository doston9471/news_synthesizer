# Fetch and get Number of pages in vb.kg
class VbScraper

  @@instance = VbScraper.new

  def initialize
    @num_pages = max_page
    puts "Max pages: #{@num_pages}"
  end

   def self.instance
     return @@instance
   end

  def all_pages
    @num_pages = 2
    @counter=0
    (1...@num_pages).each do |i|
      page_num = i
      puts page_num
      puts "________________________________"
      url = "http://www.vb.kg/?sort_by=date&search=&page=#{page_num}"

      page_by_number(url) #if page_by_number(url)==false

    end
  end

  def page_by_number(url)

    doc = Nokogiri::HTML(open(url))
      doc.css('div.cat_content ul li').each do |link|

        article = Article.new

        #Date published
        date_created = link.css("span.topic_time_create")
        puts "Date published: #{ date_created.text}"
        article.date_published= date_created.text

        #Article headline
        article_title = link.css("div.t .n")
        puts "Article title: #{article_title.text}"
        article.headline = article_title.text

        if saved_or_not(article)==true
          #Article head image
          article_img = link.css("img.img-resize")[0]
          article_img_src=nil
          if article_img!=nil
            article_img_src =  article_img['data-src']
            article.img = article_img_src.to_s
          end

          #Source url
          article_link=link.css("div.t a")[0]['href']
          puts "Article Link: #{article_link}"
          article.origurl = article_link

          article_doc = Nokogiri::HTML(open(article_link))
          article_doc.css('div#topic').each do |topic|
            # topic.css('h1.topic-name').each do |topic_name|
            #   puts topic_name.content
            # end
            topic.css('div.topic-text').each do |topic_text|
              topic_text.content
              article.textonly = topic_text.content
            end
          end

          article.portal_source_id = PortalSource.where("name=?", "vb.kg").first.id
          article.save
          puts article
          @counter=@counter+1
          puts "SAVED #{@counter}"
        else
          puts "Article Exists: #{article.headline}"
          return false
        end

      end
   end

   def saved_or_not(article)
     dbarticles = Article.where("headline=? and portal_source_id=?", article.headline, 2)
     puts dbarticles.count
     puts "RESULT"
     if dbarticles.count==0
       return true
     end

     return false
   end


  private_class_method :new

  private
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


end
