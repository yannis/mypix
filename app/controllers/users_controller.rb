class UsersController < ApplicationController

  load_and_authorize_resource :user

  def show
    @title = @user == current_user ? "Your Pix" : "User '#{@user.name}' pictures"
    @pics = @user.pics.order(created_at: :desc)
  end
end
