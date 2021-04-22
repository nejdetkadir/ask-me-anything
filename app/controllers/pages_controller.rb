class PagesController < ApplicationController
  def home
  end

  def profile
    @user = User.friendly.find(params[:id])
  end
end
