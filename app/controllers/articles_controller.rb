require 'net/http'
require 'open-uri'

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    keyword = params[:search]
    keyword = '*' if keyword==nil || keyword==''
    @articles = Article.search keyword,fields: [:headline,:textonly],page: params[:page], per_page: 10
    #@articles = Article.paginate(:page => params[:page], :per_page => 10)
  end

  def kloop
    @articles=Article.where("portal_source_id=?", 1).paginate(:page => params[:page], :per_page => 10)
    render 'index'
  end

  def vb
    @articles=Article.where("portal_source_id=?", 2).paginate(:page => params[:page], :per_page => 10)

    audiourl =@articles.first.audio
    audiourl =  URI.encode(audiourl)

    @articles.each do |article|

      puts article.audiourl

      if article.audiourl==nil || article.audiourl.length<1
        file_name = Time.now
        filename ="#{file_name.to_i}.mp3"
        save_path = Rails.root.join('public/audios', filename)
        open(save_path, 'wb') do |file|
          file << open(audiourl).read
        end

        article.audiourl='audios/'+filename
        puts article.headline
        puts filename
        puts "SAVED"

      end

    end



    render 'index'
  end

  def knews
    @articles=Article.where("portal_source_id=?", 3).paginate(:page => params[:page], :per_page => 10)
    render 'index'
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:headline, :textonly, :date_published, :textorig, :portal_source_id, :audio)
    end
end
