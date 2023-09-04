class DonationsController < ApplicationController
  before_action :set_band

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      add_ecpay_basic_params
      @ecpay_params = Payment::EcpayLogic.new(donation_params_for_ecpay).perform  
    else
      render 'new', alert: "Nope!"
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def paid
    if params['RtnMsg'] === "Succeeded"
      find_donation_by_serial_after_ecpay
      pending_to_pay
      sign_in(User.find(@serial_donation.user_id))
      return '1|OK'
    else
      @serial_donation.fail!
    end
    
  end

  private

  def set_band
    @band = Band.find(params[:band_id])
  end

  def donation_params
    params.require(:donation).permit(:amount, :note)
  end
  
  def add_ecpay_basic_params
    @merchant_trade_no = @donation.serial
    @merchant_trade_date = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    @total_amount = @donation.amount.to_i
  end

  def donation_params_for_ecpay
    {
      merchant_trade_date: @merchant_trade_date,
      merchant_trade_no: @merchant_trade_no,
      item_name: @item_name,
      total_amount: @total_amount
  }
  end

  def find_donation_by_serial_after_ecpay
    @serial_donation = Donation.find_by!(serial: params[:MerchantTradeNo])
  end
end
