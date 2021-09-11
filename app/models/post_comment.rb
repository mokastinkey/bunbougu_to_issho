class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post_bungu

  #バリデーション
  validates :content, presence: true
end
