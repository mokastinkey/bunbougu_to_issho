class BunguImage < ApplicationRecord
  belongs_to :post_bungu
  attachment :image
end
