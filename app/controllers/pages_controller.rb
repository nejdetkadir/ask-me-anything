class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:requested_friends]
  before_action :set_friend, only: %w[profile]

  def home
  end

  def profile
    @user = User.friendly.find(params[:id])
    @asks = Ask.where(friend_id: @friend.id).where.not(answer: "", answer_image: "")

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
  
  private
    def set_friend
      @friend = User.friendly.find(params[:id])
    end
end
