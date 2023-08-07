class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update ]
    # before_save :set_styles, only: [:create, :update ]
  
    def index
      @bands = Band.order(id: :desc)
    end
    
    def show
      
    end
  
    def new
      @band = Band.new
    end
  
    def create
      @band = Band.new(band_params)
      # if @band.styles?
      #   @band.set_styles
      # else
      #   #
      # end
      if @band.save
        redirect_to band_path(@band) , notice: '成功創立樂團'
      else
        render :new ,notice: '失敗'
      end
    end
  
    def edit
    end
  
    def update
      if @band.update(band_params)
        redirect_to band_path(band_id), notice: '更新成功'
      else
        render :edit , notice: '失敗'
      end
    end
  
  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    band_params = params.require(:band).permit(:name, :content, :area, :state, :founded_at, styles:[] )
  end

  # def set_styles
  #   set_styles = @band.styles.reject { |c| c.empty? }
  # end

end
