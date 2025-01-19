class Program < ApplicationRecord
  has_one_attached :image

  belongs_to :admin
  belongs_to :category

  enum publish_status: { draft: 0, published: 1, non_public: 2 }

  validates :title, presence: true
  validates :body, presence: true
  validates :start_time, presence: true
  validates :price, presence: true
  validates :time_required, presence: true
  validates :publish_status, presence: true
  validates :category_id, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
