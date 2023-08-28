# frozen_string_literal: true

module ResumeListsHelper
  def recruits_roles
    instruments_all.where(id: @recruit.instrument_ids).pluck(:name)
  end
end
