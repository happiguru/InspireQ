class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.includes(%i[replies quotes likes followed_users followers])
    @followed_and_user = current_user.followed_users
  end

  def show
    @user = User.find(params[:id])
    @quotes = @user.quotes.order('created_at DESC')
  end
end
