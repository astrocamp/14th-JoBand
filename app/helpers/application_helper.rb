# frozen_string_literal: true

module ApplicationHelper
  def instruments_all
    @instruments = Instrument.all
  end
end
