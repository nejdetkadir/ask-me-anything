class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :asks, dependent: :destroy
  has_many :friends, through: :asks
  has_many :likes, dependent: :destroy

  has_friendship

  mount_uploader :profile_img, ProfileImageUploader
  mount_uploader :background_img, BackgroundImageUploader

  # validates
  validates_uniqueness_of :username
  validates_presence_of [:fullname, :username]

  validates :bio, length: {maximum: 60}
  validates :location, length: {maximum: 25}
  validates :website, length: {maximum: 60}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :github]

  def self.from_omniauth(access_token)
    # You can learn which provider used
    provider = access_token.provider
    data = access_token.info
    user = User.where(email: data['email']).first

    if provider.eql?("github")
      unless user
        user = User.create(email: data['email'], fullname: data['fullname'], username: "#{data['username']}#{Time.now.day.to_s}".downcase.tr(" ", "_"), password: Devise.friendly_token[0,20])
      end
    else
      unless user
        user = User.create(email: data['email'], fullname: data['name'], username: "#{data['name']}#{Time.now.day.to_s}".downcase.tr(" ", "_"), password: Devise.friendly_token[0,20])
      end
    end 
    user
  end
  
  def on_friendship_created(friendship)
  end
  
  def on_friendship_accepted(friendship)
  end
  
  def on_friendship_blocked(friendship)
  end
  
  def on_friendship_destroyed(friendship)
  end
end
