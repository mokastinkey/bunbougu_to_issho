class Like < ApplicationRecord
  belongs_to :post_bungu
  belongs_to :user

  # 文房具いいねランキング
  def self.order_by_numbers_in_month(n = 3)
    where(created_at: Time.current.all_month)
    .group(:post_bungu_id)
    .order('count(post_bungu_id) desc')
    .limit(n)
  end

end
