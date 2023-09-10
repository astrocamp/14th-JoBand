class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create]
  before_action :set_band, only: %i[new create show]
  
  def show
    @order = Order.find(params[:id])
    @form_info = Newebpay::Mpg.new(
      {MerchantOrderNo: @order.created_at.strftime('%Y:%H:%M')
        Amt: @order.amount.to_i,
        ItemDesc: @order.band_id,
        Email: @order.user.email}
      ).form_info
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = @band.orders.new(order_params) 
    @order.user = current_user
    if @order.save
      redirect_to band_order_path(@order, @order), notice: "啤酒裝箱中！"
    else
      flash.now[:alert] = "交易失敗，請再試一次"
      puts @order.errors.full_messages
      render :new
    end
  end

  private

  def set_band
    @band = Band.friendly.find(params[:band_slug])
  end
  
  
  def order_params
    params.require(:order).permit(:amount, :note, :band_id)
  end

end