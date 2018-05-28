# frozen_string_literal: true

# Methods used in match comparison
module MatchComparisonOperations
  def goal_diff
    home_team_score - away_team_score
  end

  def winner
    return :draw if home_team_score == away_team_score
    return :local if home_team_score > away_team_score
    :visitor
  end
end
