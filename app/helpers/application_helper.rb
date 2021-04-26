module ApplicationHelper

  def liked_it(user_id, ask_id)
    Like.where(ask_id: ask_id, user_id: user_id).first
  end

  def asks_count
    Ask.where(friend_id: current_user.id, answer: "", answer_image: nil).count
  end
end
