class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true

  # snsモデル
  has_many :google

  # PostBunguモデル
  has_many :post_bungus, dependent: :destroy
  attachment :profile_image

  # PostCommentモデル
  has_many :post_comments, dependent: :destroy

  # Relationshipモデル
  has_many :following, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following_user, through: :following, source: :follower
  has_many :follower_user, through: :follower, source: :following

  # ユーザをフォローする
  def follow(user_id)
    following.create(follower_id: user_id)
  end

  # フォローを外すときのメソッド
  def unfollow(user_id)
    following.find_by(follower_id: user_id).destroy
  end

  # フォローしているかを確認する
  def following?(user)
    following_user.include?(user)
  end

  # Likeモデル
  has_many :likes, dependent: :destroy
  has_many :like_post_bungus, through: :likes, source: :post_bungu

  def own?(post_bungu)
    id == post_bungu.user_id
  end

  def like?(post_bungu)
    like_post_bungus.include?(post_bungu)
  end

  def liked_by?(post_bungu)
    likes.where(post_bungu_id: post_bungu).exists?
  end

  # キーワード検索
  def self.nickname_like(nickname)
    where("nickname LIKE ?", "%#{nickname}%")
  end

  # google認証
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
    end
  end
end
