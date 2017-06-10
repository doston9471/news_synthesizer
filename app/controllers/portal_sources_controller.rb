class PortalSourcesController < ApplicationController
  before_action :set_portal_source, only: [:show, :edit, :update, :destroy]

  # GET /portal_sources
  # GET /portal_sources.json
  def index
    @portal_sources = PortalSource.all
  end

  # GET /portal_sources/1
  # GET /portal_sources/1.json
  def show
  end

  # GET /portal_sources/new
  def new
    @portal_source = PortalSource.new
  end

  # GET /portal_sources/1/edit
  def edit
  end

  # POST /portal_sources
  # POST /portal_sources.json
  def create
    @portal_source = PortalSource.new(portal_source_params)

    respond_to do |format|
      if @portal_source.save
        format.html { redirect_to @portal_source, notice: 'Portal source was successfully created.' }
        format.json { render :show, status: :created, location: @portal_source }
      else
        format.html { render :new }
        format.json { render json: @portal_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal_sources/1
  # PATCH/PUT /portal_sources/1.json
  def update
    respond_to do |format|
      if @portal_source.update(portal_source_params)
        format.html { redirect_to @portal_source, notice: 'Portal source was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal_source }
      else
        format.html { render :edit }
        format.json { render json: @portal_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal_sources/1
  # DELETE /portal_sources/1.json
  def destroy
    @portal_source.destroy
    respond_to do |format|
      format.html { redirect_to portal_sources_url, notice: 'Portal source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_source
      @portal_source = PortalSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_source_params
      params.require(:portal_source).permit(:name, :size)
    end
end
