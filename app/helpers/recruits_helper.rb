# frozen_string_literal: true

module RecruitsHelper
  def instruments_all
    @instruments = Instrument.all
  end
end
