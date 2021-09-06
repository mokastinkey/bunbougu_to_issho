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

  validates :other_manufacturer, length: { maximum: 20 }, presence: true, if: :others_manufacturer?

  def others_manufacturer?
    manufacturer == "other"
  end
  
  #Likeモデルとの関係
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

end
