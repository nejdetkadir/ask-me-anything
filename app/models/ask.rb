class Ask < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :friend_id

  mount_uploader :answer_image, AskAnswerUploader

  has_many :likes, dependent: :destroy

  # validations
  validates :ask, presence: { message: "Ask can not be blank" }, length: {maximum: 300, minimum: 3}
  validates :answer, length: {maximum: 500}
end
