# frozen_string_literal: true

module Newebpay
  class Mpg
    attr_accessor :info

    def initialize(params)
      @key = ENV['NEWEBPAY_HASH_KEY']
      @iv = ENV['NEWEBPAY_HASH_IV']
      @merchant_id = 'MS150221613'
      @info = {}
      set_info(params)
    end

    def form_info
      {
        MerchantID: @merchant_id,
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: '2.0'
      }
    end

    private

    def set_info(order)
      info[:MerchantID] = @merchant_id
      info[:RespondType] = 'JSON'
      info[:TimeStamp] = Time.now.to_i
      info[:Version] = '2.0'
      info[:MerchantOrderNo] = order[:MerchantOrderNo]
      info[:Amt] = order[:Amt]
      info[:ItemDesc] = order[:ItemDesc]
      info[:Email] = order[:Email]
      info[:ReturnURL] = "https://#{ENV['DOMAIN']}/bands/#{order[:Band].slug}/orders/paid"
      info[:LoginType] = 0
      info[:CREDIT] = 1
      info[:VACC] = 1
    end

    def url_encoded_query_string
      URI.encode_www_form(info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher.new('aes-256-cbc')
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack1('H*')
    end

    def trade_info
      aes_encode(url_encoded_query_string)
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def trade_sha
      sha256_encode(@key, @iv, trade_info)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
  end
end
