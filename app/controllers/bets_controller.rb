# frozen_string_literal: true

# Handles logins/logouts
class BetsController < ApplicationController
  before_action :signed_in?

  def index
    @pending_bets, @made_bets = AllBets.for(current_user)
  end

  def create
    @bet = current_user.bets.create(bet_params)
    redirect_to bets_path
  end

  def update; end

  private

  def bet_params
    params.require(:bet).permit(:home_team_score, :away_team_score, :match_id)
  end
end
