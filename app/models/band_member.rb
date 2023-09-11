# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum identity: %i[leader manager member]

  def self.default_roles
    %w[
      吉他手
      貝斯手
      主唱
      鼓手
      鍵盤手
    ]
  end
end
