# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:paid, :paid_success]

  before_action :authenticate_user!, only: %i[index new create]
  before_action :set_band, only: %i[new create paid]

  def show
    @order = Order.find(params[:id])
    @form_info = Newebpay::Mpg.new(
      { MerchantOrderNo: @order.tracking_number,
        Amt: @order.amount.to_i,
        ItemDesc: @order.band_id,
        Email: @order.user.email,
        Band: @order.band }
    ).form_info
  end

  def new
    @order = Order.new
  end

  def create
    @order = @band.orders.new(order_params)
    @order.user = current_user
    @order.generate_tracking_number
    if @order.save
      redirect_to band_order_path(@band, @order), notice: '啤酒裝箱中！'
    else
      flash.now[:alert] = '交易失敗，請再試一次'
      puts @order.errors.full_messages
      render :new
    end
  end

  def notify
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    @order = Order.find_by(tracking_number: @response.order_no)

    if @response.success?
      @order.update(payment_status: 'paid')
      redirect_to paid_order_path(@order), notice: '交易成功'
    else
      redirect_to paid_order_path(@order), alert: '交易失敗'
    end
  end

  def paid
    response = Newebpay::MpgResponse.new(params[:TradeInfo])

    if response.success?
      # @order.update(payment_status: 'paid')
      # sign_in(@order.user)
      # sign_in_and_redirect @user, location: paid_order_path(@order)

      redirect_to paid_success_band_orders_path(@band, order: response.order_no), notice: '交易成功'
    else
      redirect_to paid_order_path(@order), alert: '交易失敗，啤酒似乎缺貨了'
    end
  end

  def paid_success
    @order = Order.find_by(tracking_number: params[:order])
  end

  private

  def set_band
    @band = Band.friendly.find(params[:band_slug])
  end

  def order_params
    params.require(:order).permit(:amount, :note, :band_id)
  end
end
