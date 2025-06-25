class Program < ApplicationRecord
  scope :publidhed, -> { where(publish_status: "published") }
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

  def get_image_resize(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(gravity: :center, resize: "#{width}x#{height}^", crop: "#{width}x#{height}+0+0").processed
  end

  def get_image
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [600, 600]).processed
  end

  def start_date
    start_time&.to_date
  end

  def start_date=(date)
    if date.present?
      date = Date.parse(date) if date.is_a?(String)
      if start_time.present?
        self.start_time = start_time.change(year: date.year, month: date.month, day: date.day)
      else
        self.start_time = date.to_time
      end
    end
  end

  def start_time_only
    return nil unless start_time.present?
    
    time_obj = start_time.is_a?(String) ? Time.parse(start_time) : start_time
    time_obj.change(year: 2000, month: 1, day: 1)
  end

  def start_time_only=(time)
    if time.present?
      hour, minute = time.split(":").map(&:to_i)
      if start_time.present?
        self.start_time = start_time.change(hour: hour, min: minute)
      else
        self.start_time = Time.current.change(hour: hour, min: minute)
      end
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Program.where(title: content)
    elsif method == 'forward'
      Program.where('title Like ?', content + '%')
    elsif method == 'backword'
      Program.where('title Like ?', '%' + content)
    else
      Program.where('title Like ?', '%' + content + '%')
    end
  end
end
