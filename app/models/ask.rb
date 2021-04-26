class Ask < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :friend_id

  mount_uploader :answer_image, AskAnswerUploader

  has_many :likes, dependent: :destroy

  # validations
  validates :ask, presence: true, length: {maximum: 300, minimum: 3}
  validates :answer, presence: true, length: {maximum: 500, minimum: 3}
end
