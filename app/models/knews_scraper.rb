class KnewsScraper

	@@instance = KnewsScraper.new

	def initialize
		@num_pages = max_page
	    puts "Max pages: #{@num_pages}"
	end

	def self.instance
    	return @@instance
  end

	def all_pages
		@counter = 0
		@num_pages = 1
		# (1...@num_pages).each do |step|
			page_num = 1
			# puts page_num
			# puts "_____________________________"
			url = "http://knews.kg/page/#{page_num}/?s"
			page_by_number(url) # if page_by_number(url)==true
		# end
	end

	def page_by_number(url)
		doc = Nokogiri::HTML(open(url))

		doc.css("h3 a").each do |link|
			article = Article.new
			article_title = link.attribute("title").to_s
			article_link = link.attribute("href").to_s
			# article_img = link.css("img.entry-thumb")
			article.headline = article_title
			article.origurl = article_link
			puts "Article title: #{article_title}"
			puts "Article link: #{article_link}"
			if saved_or_not(article)==true
				article_doc = Nokogiri::HTML(open(article_link))
				article_doc.css("div.td-post-content p")
				topic = article_doc.css("div.td-post-content p").text
				date_created = article_doc.css("div.td-post-date")
				date = date_created.text
				published = date[0...17]
				article.date_published = published
				article.textonly = topic
				article.portal_source_id = PortalSource.where("name=?", "knews.kg").first.id
				article.save
				puts article
				@counter = @counter + 1

				if @counter>8
					return true
				end

			else
				return false
			end
		end
	end

	def saved_or_not(article)
		dbarticles = Article.where("headline=? and portal_source_id=?", article.headline, 3)
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
	      pages = Nokogiri::HTML(open("http://www.knews.kg/?s"))
	      num_pages=1
	      pages.css('div.page-nav td-pb-padding-side a').each do |page_link|
	          page_n=page_link.text.to_i
	          if page_n>num_pages
	            num_pages=page_n
	          end
	        end
	      return num_pages
	    end

end
