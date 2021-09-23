class PostBungu < ApplicationRecord
  before_validation do
    self.other_manufacturer = nil unless manufacturer == "other"
  end

  #Userモデルとの関係
  belongs_to :user

  #Genreモデルとの関係
  belongs_to :genre

  #PostBunguモデルとの関係
  has_many :bungu_images, dependent: :destroy
  accepts_attachments_for :bungu_images, attachment: :image

  enum manufacturer: {
    kokuyo: 0,
    plus: 1,
    zebra: 2,
    mitsubishi_pencil: 3,
    pilot: 4,
    pentel: 5,
    other: 6
  }

  with_options presence: true do
    validates :bungu_name
    validates :catchphrase
    validates :rate
    validates :price
    validates :place
  end

  validates :other_manufacturer, length: { maximum: 20 }, presence: true, if: :others_manufacturer?

  def others_manufacturer?
    manufacturer == "other"
  end

  #PostCommentモデル
  has_many :post_comments, dependent: :destroy

  #Likeモデルとの関係
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def self.sort(selection)
    if selection == 'new' then
      all.order(created_at: :DESC)
    elsif selection == 'old' then
      all.order(created_at: :ASC)
    elsif selection == 'manylikes' then
      find(Like.group(:post_bungu_id).order(Arel.sql('count(post_bungu_id) desc')).pluck(:post_bungu_id))
    else
      find(Like.group(:post_bungu_id).order(Arel.sql('count(post_bungu_id) asc')).pluck(:post_bungu_id))
    end
  end

  #キーワード検索
  def self.looks(word)
    where("bungu_name LIKE ?", "%#{word}%")
  end


end
