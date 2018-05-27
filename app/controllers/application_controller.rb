# frozen_string_literal: true

# Holds methods that are used application-wide
class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def current_user_is(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def signed_in?
    return if current_user
    redirect_to sign_in_path
  end
end
