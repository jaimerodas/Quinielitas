# frozen_string_literal: true

# One game between two teams.
class Match < ApplicationRecord
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :playtime, presence: true

  def status
    return :finished if home_team_score && away_team_score
    return :being_played if playtime <= Time.zone.now
    :ready
  end
end
