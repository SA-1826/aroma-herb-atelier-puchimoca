class Program < ApplicationRecord
  has_one_attached :image

  belongs_to :admin
  belongs_to :category

  enum publish_status: { in_progress: 0, published: 1, private: 2 }
end
