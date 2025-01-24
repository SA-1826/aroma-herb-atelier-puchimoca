class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title Like ?', content + '%')
    elsif method == 'backword'
      Post.where('title Like ?', '%' + content)
    else
      Post.where('title Like ?', '%' + content + '%')
    end
  end
  
end
