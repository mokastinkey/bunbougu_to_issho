class PostBungu < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  
  has_many :bungu_images, dependent: :destroy
  accepts_attachments_for :bungu_images, attachment: :image
  
end
