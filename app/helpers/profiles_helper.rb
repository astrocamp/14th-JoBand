# frozen_string_literal: true

module ProfilesHelper
  def instruments_all
    @instruments = Instrument.all
  end
end
