class AsksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ask, only: [:show, :update]

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

  def index
    @asks = Ask.where(friend_id: current_user.id, answer: "", answer_image: nil)
  end

  def show
  end
  
  def update
    if @ask.update(answer_params)
      flash[:notice] = "Answered successfully"
    else
      flash[:alert] = "answer error"
    end
    redirect_to profile_page_path(current_user)
  end

  private
    def ask_params
      params.require(:ask).permit(:ask, :is_anonymous, :friend_id)
    end

    def answer_params
      params.require(:ask).permit(:answer, :answer_image)
    end

    def set_ask
      @ask = Ask.where(friend_id: current_user.id, answer: "", id: params[:id], answer_image: nil).first
    end
end