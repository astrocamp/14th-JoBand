# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title: "JoBand 揪團",
      description: "專屬音樂人的社群平台。尋找合適的樂團成員，開始您的音樂之旅。",
      keywords: "樂團, 樂手, 組團, band, 音樂, 鼓手, 吉他, 貝斯, 主唱, 音樂祭",
      separator: "&mdash;".html_safe
      set_meta_tags icon: [
        {href: "/images/favicon.ico" },
      set_meta_tags canonical: "http://joband.co/canonical"
    }
  end
end
