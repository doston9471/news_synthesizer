class KloopScraper 

	@@instance = KloopScraper.new

	def initialize
		@num_pages = max_page
		puts "Max pages:#{@num_pages}"
	end

	def self.instance
		return @@instance
	end

	def all_pages
		@num_pages = 2
		@counter = 0
		(1...@num_pages).each do |i|
			page_num = i
			puts page_num
			puts "__________________________________"
			url = "https://kloop.kg/page/#{page_num}/?s"
			page_by_number(url)
		end
	end


	def page_by_number(url)
		doc = Nokogiri::HTML(open(url))
			doc.css(".item-details").each do |link|
				article = Article.new
				#Date
				date_created = link.css("div.td-module-meta-info span.td-post-date")
				puts "Date puslished: #{date_created.text}"
				article.date_published = date_created.text
				#Article
				article_title = link.css("h3")
				puts "Article title: #{article_title.text}"
				article.headline = article_title.text

				if saved_or_not(article) == true
					#Article head image
					article_img = link.css("img.img-resize")[0]
					article_img_src = nil
					if article_img != nil
						article_img_src = article_img["data-src"]
						article.img = article_img_src.to_s
					end

					#Source url
					article_link = link.css('h3 a')[0]['href']
					puts "Article Link: #{article_link}"

					@article_doc = Nokogiri::HTML(open(article_link))
					article.textonly=""
					@article_doc.css("div.td-post-content").each do |topic|
						topic.css("p").each do |topic_text|
							topic_text.content
							article.textonly = article.textonly+topic_text.content
						end
					end

					article.portal_source_id = PortalSource.where("name=?","kloop.kg").first.id
					article.save
					puts article.to_s
					@counter = @counter + 1
					puts "SAVED #{@counter}"

				end

			end
	end

	def saved_or_not(article)
		dbarticles = Article.where("headline=?",article.headline)
		if dbarticles == nil
			return true
		end
		return false
	end

	private_class_method :new

	private

		def max_page
			pages = Nokogiri::HTML(open("https://kloop.kg/?s="))
			num_pages = 1
			pages.css("div.td-module-thumb a").each do |page_link|
				page_n = page_link.text.to_i
				if page_n > num_pages
					num_pages = page_n
				end
			end
			return num_pages
		end

end
