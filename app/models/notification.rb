# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  # def mark_as_read_and_remove
  #   if self.unread?
  #     self.update(read: true) #通知已讀
  #     self.destroy # 刪除通知
  #   end
  # end
end
