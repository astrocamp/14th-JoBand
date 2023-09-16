# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title: "JoBand 揪團",
      description: "Joband是一個專為音樂人打造的社群平台，旨在協助您輕鬆尋找合適的樂團成員，開始您的音樂之旅。我們歡迎各種音樂才華，無論是鼓手、吉他手、主唱、貝斯手，還是其他音樂領域的人才。加入Joband，與全球的音樂人一起分享音樂夢想，開啟您的音樂旅程！",
      keywords: "樂團, 樂手, 組團, band, 音樂, 鼓手, 吉他, 貝斯, 主唱, 音樂祭",
      icon: [{ href: "/images/favicon.ico" }],
      canonical: "https://joband.co/"
    }
  end
  def canonical(url)
    return url
  end
end
