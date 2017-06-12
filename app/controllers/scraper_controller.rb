class ScraperController < ApplicationController
  before_action :set_yandex, only: [:kloop, :vb, :knews]
  # before_action :set_kloop, only: [:kloop]
  # before_action :set_kloop, only: [:kloop]
  # before_action :set_kloop, only: [:kloop]

  def kloop
     @scraper= KloopScraper.instance.all_pages
  end

  def vb
    @scraper= VbScraper.instance.all_pages
  end

  def knews
      @scraper= KnewsScraper.instance.all_pages
  end

  def set_yandex
    # @yandex_speech =  Yandex_Synthezator.new if @yandex_speech==nil
  end


end
