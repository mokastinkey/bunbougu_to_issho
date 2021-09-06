class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true

  #PostBunguモデル
  has_many :post_bungus, dependent: :destroy
  attachment :profile_image

  #Relationshipモデル
  has_many :following, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following_user, through: :following, source: :follower
  has_many :follower_user, through: :follower, source: :following

  #ユーザをフォローする
  def follow(user_id)
    following.create(follower_id: user_id)
  end

  #フォローを外すときのメソッド
  def unfollow(user_id)
    following.find_by(follower_id: user_id).destroy
  end

  # フォローしているかを確認する
  def following?(user)
    following_user.include?(user)
  end

  #Likeモデル
  has_many :likes, dependent: :destroy
  has_many :like_post_bungus, through: :likes, source: :post_bungu

end
