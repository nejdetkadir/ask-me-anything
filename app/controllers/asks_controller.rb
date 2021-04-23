class AsksController < ApplicationController
  before_action :authenticate_user!

  def create
    @ask = Ask.new(ask_params)
    @ask.user = current_user
    if @ask.save
      flash[:notice] = "Ask sent was successfully"
      redirect_to profile_page_path(@ask.friend)
    else
      flash[:alert] = "Something went wrong"
      redirect_to profile_page_path(@ask.friend)
    end
  end

  private
    def ask_params
      params.require(:ask).permit(:ask, :is_anonymous, :friend_id)
    end
end