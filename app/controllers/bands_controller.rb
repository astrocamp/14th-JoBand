class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update ]
  
    def index
      @bands = Band.order(id: :desc)
    end
    
    def show
    end
  
    def new
      @band = Band.new
      @styles = Style.all
    end
  
    def create
      @band = Band.new(band_params)
      
      if @band.save
        redirect_to band_path(@band) , notice: '成功創立樂團'
      else
        render :new ,notice: '失敗'
      end
    end
  
    def edit
      @styles = Style.all
    end
  
    def update
      
      if @band.update(band_params)
        redirect_to band_path(@band), notice: '更新成功'
      else
        render :edit , notice: '失敗'
      end
    end
  
  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
   params.require(:band).permit(:name, :content, :area, :state, :founded_at, style_ids:[] )
  end


end