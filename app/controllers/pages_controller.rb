class PagesController < ApplicationController
  def home
  end

  def profile
    @user = User.friendly.find(params[:id])
  end

  def explore
    if user_signed_in?
      @users = User.where('id != ?', current_user.id).limit(32)
    else
      @users = User.order(id: :desc).limit(32)
    end
  end
end
