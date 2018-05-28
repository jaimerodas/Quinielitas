# frozen_string_literal: true

# Returns all of the bets already made plus any pending bets for a given user
class AllBets
  def self.for(user)
    new(user).call
  end

  def initialize(user)
    @user = user
  end

  attr_reader :user

  def call
    [pending_bets, made_bets]
  end

  private

  def user_bets
    @user_bets ||= user.bets
  end

  def made_bets
    user_bets.includes(:match).order('matches.playtime ASC')
  end

  def pending_bets
    matches_with_no_bets.order(playtime: :asc).map do |match|
      user.bets.build(match_id: match.id)
    end
  end

  def matches_with_no_bets
    Match.where.not(id: user_bets.select(:match_id).map(&:match_id))
  end
end
