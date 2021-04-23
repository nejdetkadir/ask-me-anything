class UsersController < ApplicationController
  before_action :authenticate_user!

  def create_friend
    friend = User.friendly.find(params[:id])
    if current_user != friend
      if current_user.pending_friends.include?(friend)
        flash[:alert] = "You have already sent friend request to ali #{friend.fullname}"
      elsif current_user.friends_with?(friend)
        current_user.remove_friend(friend)
        flash[:notice] = "#{friend.fullname} was removed from your friends list" 
      else
        current_user.friend_request(friend)
        flash[:notice] = "Friend request sent to #{friend.fullname}"
      end
    end
    redirect_to profile_page_path(friend)
  end
end