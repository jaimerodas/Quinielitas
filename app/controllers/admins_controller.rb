# frozen_string_literal: true

# User's administration thingies
class AdminsController < ApplicationController
  before_action :signed_in_admin?
  before_action :find_user

  def create
    change_admin_status true
  end

  def destroy
    change_admin_status false
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def change_admin_status(status)
    @user.update(admin: status)
    redirect_to users_path
  end
end
