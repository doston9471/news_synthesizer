class ScraperController < ApplicationController
  before_action :set_yandex, only: [:kloop, :vb, :knews]
  # before_action :set_kloop, only: [:kloop]
  # before_action :set_kloop, only: [:kloop]
  # before_action :set_kloop, only: [:kloop]

  def kloop
    
  end

  def vb

  end

  def knews

  end

  def set_yandex

    @yandex_speech =  Yandex_Synthezator.new if @yandex_speech==nil

  end


end
