class AsksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ask, only: [:show, :update, :destroy]
  
  include ApplicationHelper

  def create
    @ask = Ask.new(ask_params)
    @ask.user = current_user
    if @ask.save
      flash[:notice] = "Ask sent was successfully"
      redirect_to profile_page_path(@ask.friend)
    else
      flash[:alert] = "Something went wrong"
      @ask.errors.full_messages.each do |error|
        flash[:alert] = error
        break
      end      
      redirect_to profile_page_path(@ask.friend)
    end
  end

  def index
    @asks = Ask.where(friend_id: current_user.id, answer: "", answer_image: nil)
  end

  def show
  end

  def like
    @ask = Ask.find(params[:id])
    if liked_it(current_user.id, @ask.id)
      liked_it(current_user.id, @ask.id).destroy
      flash[:notice] = "You got the liking undo"
    else
      flash[:notice] = "You like it"
      @like = Like.new
      @like.user = current_user
      @like.ask = @ask
      @like.save
    end
    redirect_to profile_page_path(current_user)
  end

  def destroy
    @ask = Ask.find(params[:id])

    if @ask.friend == current_user
      if @ask.destroy
        flash[:notice] = "Deleted successfully"
      else
        flash[:alert] = "Something went wrong"
      end
    else
      flash[:alert] = "access denied"
    end

    redirect_to profile_page_path(current_user)
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