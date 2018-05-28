# frozen_string_literal: true

# User's administration thingies
class UsersController < ApplicationController
  include Pagy::Backend

  before_action :signed_in_admin?

  def index
    @pagy, @users = pagy User.all.order(name: :desc)
  end

  def destroy
    @user = User.where.not(id: current_user.id).find(params[:id])
    @user.destroy

    flash[:notice] = 'Usuario borrado'
    redirect_to users_path
  end
end
