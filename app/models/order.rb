class Order < ApplicationRecord
  
  # associations
  belongs_to :user
  belongs_to :band


  def generate_tracking_number
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    random_part = SecureRandom.alphanumeric(30 - timestamp.length)
    self.tracking_number = "#{timestamp}#{random_part}"
  end

end
