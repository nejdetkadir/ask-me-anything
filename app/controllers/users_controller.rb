class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, expect: %w[update]
  before_action :user_params, only: %w[update]

  def update
    if current_user.update(user_params)
      flash[:notice] = "Your profile updated successfully"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to profile_page_path(current_user)
  end

  def accept_friend
    if current_user.requested_friends.include?(@friend)
      if current_user.accept_request(@friend)
        flash[:notice] = "You accepted friend request of #{@friend.fullname}"
      else
        flash[:alert] = "Something went wrong when accepting friend request of #{@friend.fullname}"
      end
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to requested_friends_page_path
  end

  def decline_friend
    if current_user.requested_friends.include?(@friend)
      if current_user.decline_request(@friend)
        flash[:notice] = "You declined friend request of #{@friend.fullname}"
      else
        flash[:alert] = "Something went wrong when declining friend request of #{@friend.fullname}"
      end
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to requested_friends_page_path
  end

  def remove_friend
    if current_user.friends_with?(@friend)
      current_user.remove_friend(@friend)
      if current_user.friends_with?(@friend)
        flash[:alert] = "Something went wrong when removing #{@friend.fullname} from friends"
      else
        flash[:notice] = "You removed #{@friend.fullname} from friends"
      end
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to profile_page_path(current_user)
  end

  def create_friend
    if current_user != @friend
      if current_user.pending_friends.include?(@friend)
        flash[:alert] = "You have already sent friend request to ali #{@friend.fullname}"
      elsif current_user.friends_with?(@friend)
        current_user.remove_friend(@friend)
        flash[:notice] = "#{friend.fullname} was removed from your friends list" 
      else
        current_user.friend_request(@friend)
        flash[:notice] = "Friend request sent to #{@friend.fullname}"
      end
    end
    redirect_to profile_page_path(@friend)
  end

  private
    def set_friend
      @friend = User.friendly.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:profile_img)
    end
end