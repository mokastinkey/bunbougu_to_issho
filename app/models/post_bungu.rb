class PostBungu < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  has_many :bungu_images, dependent: :destroy
  accepts_attachments_for :bungu_images, attachment: :image

  enum manufacturer: {
    kokuyo: 0,
    plus: 1,
    zebra: 2,
    mitsubishi_pencil: 3,
    pilot: 4,
    pentel: 5
  }

end
