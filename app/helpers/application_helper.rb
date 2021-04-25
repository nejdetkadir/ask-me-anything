module ApplicationHelper

  def liked_it(user_id, ask_id)
    Like.where(ask_id: ask_id, user_id: user_id).first
  end
end
