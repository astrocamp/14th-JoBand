class Donation < ApplicationRecord
  
  before_create :set_serial
  
  # relationship
  belongs_to :user
  belongs_to :band





  def set_serial
    self.serial = serial_generator
  end

  def serial_generator
    date = Time.now.strftime('%Y%m%d')
    random = SecureRandom.alphanumeric(6).upcase

    "#{date}#{random}"
  end

  # transaction state
  include AASM

  aasm column: 'status', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :cancelled, :failed

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :cancelled
    end

    event :fail do
      transitions from: :pending, to: :failed
    end
  end
end
