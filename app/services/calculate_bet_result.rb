# frozen_string_literal: true

# Calculates the points for all bets of a given match
class CalculateBetResult
  def self.for(match)
    new(match).call
  end

  def initialize(match)
    @match = match
  end

  attr_reader :match

  def call
    bets.each do |bet|
      points = calculate_result_for(bet)
      bet.update(points: points)
    end
  end

  private

  def bets
    match.bets
  end

  def calculate_result_for(bet)
    %i[
      home_team_score away_team_score goal_diff
    ].sum { |operation| comparison(bet, operation) }
      .yield_self { |points| points + comparison(bet, :winner, weight: 2) }
  end

  def comparison(bet, operation, weight: 1)
    bet.public_send(operation) == match.public_send(operation) ? weight : 0
  end
end
