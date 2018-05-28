# frozen_string_literal: true

# Manages matches in the app
class MatchesController < ApplicationController
  include Pagy::Backend

  before_action :signed_in_admin?
  before_action :find_match, only: %i[edit update destroy]

  def index
    @pagy, @matches = pagy Match.all.order(playtime: :asc), items: 10
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      flash[:notice] = 'Partido creado'
      redirect_to matches_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @match.update(match_params)
      flash[:notice] = 'Partido actualizado'
      redirect_to matches_path
    else
      render :edit
    end
  end

  def destroy
    @match.destroy
    flash[:notice] = 'Partido borrado'
    redirect_to matches_path
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:home_team, :away_team, :playtime)
  end
end
