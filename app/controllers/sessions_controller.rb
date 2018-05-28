# frozen_string_literal: true

# Handles logins/logouts
class SessionsController < ApplicationController
  before_action :no_current_user, only: %i[new create]
  def new; end

  def create
    current_user_is User.find_or_create_from_auth_hash(auth_hash)
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  private

  def no_current_user
    return unless current_user
    redirect_to matches_path, alert: 'Ya tienes una sesión iniciada!'
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
