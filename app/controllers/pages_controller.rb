class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:requested_friends]

  def home
  end

  def profile
    @user = User.friendly.find(params[:id])

    @ask = Ask.new
    @ask.friend = @user
  end

  def requested_friends
    @requested_friends = current_user.requested_friends
  end

  def explore
    if user_signed_in?
      @users = User.where('id != ?', current_user.id).limit(32)
    else
      @users = User.order(id: :desc).limit(32)
    end
  end
end
